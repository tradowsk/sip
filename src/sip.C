#include "../catalycity/catalycity_runner.h"

#include <queso/Environment.h>
#include <queso/VectorSpace.h>
#include <queso/GslVector.h>
#include <queso/GslMatrix.h>
#include <queso/BoxSubset.h>
#include <queso/UniformVectorRV.h>
#include <queso/GaussianLikelihoodDiagonalCovariance.h>
#include <queso/GenericVectorRV.h>
#include <queso/StatisticalInverseProblem.h>
#include <queso/LinearLagrangeInterpolationSurrogate.h>
#include <queso/InterpolationSurrogateBuilder.h>
#include <queso/InterpolationSurrogateIOASCII.h>

#include <fstream>

#include "grins/string_utils.h"

template<typename VectorType = QUESO::GslVector, typename MatrixType = QUESO::GslMatrix>
class Likelihood : public QUESO::GaussianLikelihoodDiagonalCovariance<VectorType,MatrixType>
{
public:

  Likelihood( const QUESO::VectorSet<VectorType,MatrixType> & domain,
              const VectorType & observations,
              const VectorType &  variance,
              std::vector<QUESO::LinearLagrangeInterpolationSurrogate<VectorType,MatrixType> *> & surrogates,
              std::vector<QUESO::InterpolationSurrogateIOASCII<QUESO::GslVector,QUESO::GslMatrix> *> & surrogate_io)
    : QUESO::GaussianLikelihoodDiagonalCovariance<VectorType,MatrixType>("likelihood_", domain, observations, variance),
    _surrogates(surrogates),
    _surrogate_io(surrogate_io)
  {}

  virtual void evaluateModel(const VectorType & domainVector, VectorType & modelOutput) const
  {
    unsigned int n_temps = _surrogates.size();

    for (unsigned int s=0; s<n_temps; ++s)
      {
        double surr_val = _surrogates[s]->evaluate(domainVector);
        
        modelOutput[s] = surr_val;
      }
  }
  
  private:
    std::vector<QUESO::LinearLagrangeInterpolationSurrogate<VectorType,MatrixType> *> _surrogates;
    std::vector<QUESO::InterpolationSurrogateIOASCII<QUESO::GslVector,QUESO::GslMatrix> *> _surrogate_io;

};


int main(int argc, char ** argv)
{
  if (argc < 4)
  {
    std::cerr <<"at least 4 arguments required ./generate_surrogate dim cat_model temps, found " <<(argc-1) <<std::endl;
    return -1;
  }
  
  MPI_Init(&argc, &argv);

    std::string dim = argv[1];
    std::string cat_model = argv[2];
    
    static std::map<std::string,unsigned int> model_map;
    model_map["constant"]          = 0;
    model_map["arrhenius"]         = 1;
    model_map["pwr"]               = 2;
    model_map["reduced_pwr"]       = 3;
    model_map["reduced_arrhenius"] = 4;

    unsigned int n_params = 0;
    std::vector<double> min;
    std::vector<double> max;
    std::vector<double> initials;
    std::vector<double> prop_cov;
    switch(model_map[cat_model])
      {
        case 0:
          n_params = 1;
          min.push_back(0.010);
          max.push_back(0.200);
          initials.push_back(0.040);
          prop_cov.push_back(0.03);
          break;
        case 1:
          n_params = 2;
          min.push_back(0.01);
          min.push_back(-1400.0);
          max.push_back(0.10);
          max.push_back(-700.0);
          initials.push_back(0.07);
          initials.push_back(-1250.0);
          prop_cov.push_back(0.006);
          prop_cov.push_back(50.0);
          break;
        case 2:
          n_params = 3;
          min.push_back(0.01);
          min.push_back(700.0);
          min.push_back(-1.5);
          max.push_back(0.10);
          max.push_back(1400.0);
          max.push_back(-0.1);
          initials.push_back(0.05);
          initials.push_back(1250.0);
          initials.push_back(-0.75);
          prop_cov.push_back(0.02);
          prop_cov.push_back(50.0);
          prop_cov.push_back(0.10);
          break;
        case 3: // reduced pwr
          n_params = 2;
          min.push_back(0.0);
          min.push_back(-1.5);
          max.push_back(2.0);
          max.push_back(-0.1);
          initials.push_back(1.0);
          initials.push_back(-0.75);
          prop_cov.push_back(0.05);
          prop_cov.push_back(0.10);
          break;
        case 4: // reduced arrhenius
          n_params = 1;
          min.push_back(0.01);
          max.push_back(0.10);
          initials.push_back(0.05);
          prop_cov.push_back(0.006);
          break;
        default:
          std::cerr <<"********* Unrecognized catalycity model: " <<cat_model <<std::endl;
          return -1;
      }

    double sigma = 2.50e-3;

    unsigned int n_temps = argc-3;
    
    unsigned int n_data_points = 1;
    unsigned int n_data = n_temps*n_data_points;
    
    std::vector<std::string> temps(n_data);
    for (int i=3; i<argc; ++i)
      temps[i-3] = std::string(argv[i]);

    QUESO::FullEnvironment env(MPI_COMM_WORLD,"./"+cat_model+"_queso.in", "", NULL);

    QUESO::VectorSpace<> param_space( env, "param_", n_params, NULL );

    QUESO::VectorSpace<> data_space( env, "data_", n_data, NULL );

    std::vector<QUESO::LinearLagrangeInterpolationSurrogate<QUESO::GslVector,QUESO::GslMatrix> *> surrogates(n_temps);
    std::vector<QUESO::InterpolationSurrogateIOASCII<QUESO::GslVector,QUESO::GslMatrix> *> surrogate_io(n_temps);

    QUESO::GslVector obs( data_space.zeroVector() );

    unsigned int index = 0;
    
    for (unsigned int i = 0; i<n_temps; ++i)
      {
        std::cout <<"***************Start Read****************" <<std::endl;
        
        std::string surrogate_filename = "./"+dim+"d/"+cat_model+"/surrogate_data/surr_"+temps[i]+".dat";
        std::string surrogate_prefix = "surr_"+temps[i];

        QUESO::InterpolationSurrogateIOASCII<QUESO::GslVector,QUESO::GslMatrix> * data_reader = new QUESO::InterpolationSurrogateIOASCII<QUESO::GslVector,QUESO::GslMatrix>();

        data_reader->read(surrogate_filename,env,surrogate_prefix);
        QUESO::LinearLagrangeInterpolationSurrogate<QUESO::GslVector,QUESO::GslMatrix> * surrogate = new QUESO::LinearLagrangeInterpolationSurrogate<QUESO::GslVector,QUESO::GslMatrix>( data_reader->data() );
        
        surrogates[i] = surrogate;
        surrogate_io[i] = data_reader;
        
        std::string noisy_filename = "./"+dim+"d/"+cat_model+"/noisy_data/noisy_"+temps[i]+".dat";
        std::ifstream data_file;
        data_file.open(noisy_filename);

        std::cout <<"Noisy data filename: " <<noisy_filename <<std::endl;

        if (!data_file.is_open())
          {
            std::stringstream ss;
            ss <<"Unable to open provided noisy data file: " <<noisy_filename <<std::endl;
            libmesh_error_msg(ss.str());
          }

        while(!data_file.eof())
          {
            std::string line;
            getline(data_file,line);
            
            if (line == "")
              continue;
            
            double data_val = GRINS::StringUtilities::string_to_T<double>(line);
            
//            std::cout <<"Index: " <<index <<", value: " <<data_val <<std::endl;
            
            obs[index++] = data_val;
          }  
        
        data_file.close();
      }
      
    if (env.fullRank() == 0)  
      std::cout <<"\n\n===========================================\n"
              <<"n_temps: " <<n_temps <<", data_per_temp: " <<n_data_points <<", total_data: " <<index
              <<"\n===========================================\n" <<std::endl;

    
    QUESO::GslVector min_vals( param_space.zeroVector() );
    for (unsigned int i=0; i<n_params; ++i)
      min_vals[i] = min[i];
    
    QUESO::GslVector max_vals( param_space.zeroVector() );
    for (unsigned int i=0; i<n_params; ++i)
      max_vals[i] = max[i];

    QUESO::BoxSubset<> param_domain( "param_domain_", param_space, min_vals, max_vals );
    
    QUESO::UniformVectorRV<> prior( "prior_", param_domain);

    QUESO::GslVector variance( data_space.zeroVector() );
    variance.cwSet(sigma*sigma);

    Likelihood<> likelihood( param_domain, obs, variance, surrogates, surrogate_io );

    QUESO::GenericVectorRV<> post("post_", param_space);
    
    QUESO::GslVector paramInitials( param_space.zeroVector() );
    for (unsigned int i=0; i<n_params; ++i)
      paramInitials[i] = initials[i];

    QUESO::GslMatrix propCovMatrix(param_space.zeroVector());
    for (unsigned int i=0; i<n_params; ++i)
      propCovMatrix(i,i) = prop_cov[i];

    QUESO::StatisticalInverseProblem<> ip("", NULL,
                                          prior,
                                          likelihood,
                                          post);

    ip.solveWithBayesMetropolisHastings(NULL, paramInitials, &propCovMatrix);
    
  MPI_Finalize();

  return 0;
}

