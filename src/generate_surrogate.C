#include "../catalycity/catalycity_runner.h"

#include "grins/variable_warehouse.h"

#include <queso/Environment.h>
#include <queso/VectorSpace.h>
#include <queso/GslVector.h>
#include <queso/GslMatrix.h>
#include <queso/BoxSubset.h>
#include <queso/UniformVectorRV.h>
#include <queso/GaussianLikelihoodDiagonalCovariance.h>
#include <queso/GenericVectorRV.h>
#include <queso/LinearLagrangeInterpolationSurrogate.h>
#include <queso/InterpolationSurrogateBuilder.h>
#include <queso/InterpolationSurrogateIOASCII.h>
#include <queso/MpiComm.h>

#include <fstream>

template<typename VectorType = QUESO::GslVector, typename MatrixType = QUESO::GslMatrix>
class MyInterpolationBuilder : public QUESO::InterpolationSurrogateBuilder<VectorType,MatrixType>
{
  public:
    MyInterpolationBuilder( QUESO::InterpolationSurrogateDataSet<VectorType,MatrixType>& data, std::string & input_filename, MPI_Comm comm )
      : QUESO::InterpolationSurrogateBuilder<VectorType,MatrixType>(data)
    {
      char * arv[] = {
                      (char*)"",
                      (char*)input_filename.c_str(),
                      (char*)"-ksp_type",
                      (char*)"preonly",
                      (char*)"-pc_type",
                      (char*)"lu",
                      (char*)"-pc_factor_mat_solver_package",
                      (char*)"mumps"
                     };

      _runner = new CatalycityRunner(8,arv,comm);    
    };

    virtual ~MyInterpolationBuilder(){};

    virtual void evaluate_model( const VectorType & domainVector, std::vector<double> & values )
    {
      std::vector<double> params;
      for (unsigned int i=0; i<domainVector.sizeGlobal(); ++i)
        params.push_back(domainVector[i]);

      // TODO this is ugly
      GRINS::GRINSPrivate::VariableWarehouse::clear();
      _runner->init();
      _runner->get_cat_simulation()->set_catalycity_params( params );
      
      _runner->run();
        
      values[0] =  _runner->get_simulation().get_qoi_value(0);
      
    }
    
  private:
    CatalycityRunner * _runner;

};



int main(int argc, char ** argv)
{
  if (argc < 4)
  {
    std::cerr <<"at least 3 arguments required ./generate_surrogate dim cat_model temp, found " <<(argc-1) <<std::endl;
    return -1;
  }
  
  MPI_Init(&argc, &argv);
  
    std::string dim = argv[1];
    std::string cat_model = argv[2];
    std::string T = argv[3];
    
    static std::map<std::string,unsigned int> model_map;
    model_map["constant"] = 0;
    model_map["arrhenius"] = 1;
    model_map["pwr"] = 2;
    model_map["reduced_arrhenius"] = 3;
    model_map["reduced_pwr"] = 4;

    unsigned int n_params = 0;
    std::vector<double> min;
    std::vector<double> max;
    std::vector<unsigned int> n_points;
    switch(model_map[cat_model])
      {
        case 0:
          n_params = 1;
          min.push_back(0.010);
          max.push_back(0.200);
          n_points.push_back(191);
          break;
        case 1:
          n_params = 2;
          min.push_back(0.01);
          min.push_back(-1400.0);
          max.push_back(0.10);
          max.push_back(-700.0);
          n_points.push_back(37);
          n_points.push_back(36);
          break;
        case 2:
          n_params = 3;
          min.push_back(0.01);
          min.push_back(700.0);
          min.push_back(-1.5);
          max.push_back(0.10);
          max.push_back(1400.0);
          max.push_back(-0.1);
          n_points.push_back(10);
          n_points.push_back(36);
          n_points.push_back(15);
          break;
        case 3:
          n_params = 1;
          min.push_back(0.01);
          max.push_back(1.0);
          n_points.push_back(100);
          break;
        case 4:
          n_params = 2;
          min.push_back(0.0);
          min.push_back(-2.5);
          max.push_back(1.0);
          max.push_back(-0.1);
          n_points.push_back(10);
          n_points.push_back(25);
          break;
        default:
          std::cerr <<"********* Unrecognized catalycity model: " <<cat_model <<std::endl;
          return -1;
      }
    
    unsigned int n_data = 1;
    
    std::string input_filename = "./"+dim+"d/"+cat_model+"/"+T+".in";
    std::string data_filename = "./"+dim+"d/"+cat_model+"/surrogate_data/surr_"+T+".dat";

    QUESO::FullEnvironment env(MPI_COMM_WORLD,"./"+cat_model+"_surrogate.in", "", NULL);

    QUESO::VectorSpace<> param_space( env, "param_", n_params, NULL );

    QUESO::VectorSpace<> data_space( env, "data_", n_data, NULL );

    QUESO::GslVector min_vals( param_space.zeroVector() );
    for (unsigned int i=0; i<n_params; ++i)
      min_vals[i] = min[i];
    
    QUESO::GslVector max_vals( param_space.zeroVector() );
    for (unsigned int i=0; i<n_params; ++i)
      max_vals[i] = max[i];
      
    QUESO::BoxSubset<> param_domain( "param_domain_", param_space, min_vals, max_vals );
   
    QUESO::InterpolationSurrogateDataSet<QUESO::GslVector, QUESO::GslMatrix> data(param_domain,n_points,n_data);
    
    MyInterpolationBuilder<QUESO::GslVector,QUESO::GslMatrix> builder( data, input_filename, env.subComm().Comm() );
    builder.build_values();

    QUESO::InterpolationSurrogateIOASCII<QUESO::GslVector, QUESO::GslMatrix> data_writer;
    data_writer.write(data_filename, data.get_dataset(0));

  MPI_Finalize();

  return 0;
}

