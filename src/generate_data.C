
#include <string>
#include <iostream>
#include <fstream>

#include "mpi.h"

#include "libmesh/parallel.h"

#include "grins/runner.h"
#include "grins/composite_qoi.h"

#include "queso/Environment.h"
#include "queso/VectorSpace.h"
#include "queso/GslVector.h"
#include "queso/BoxSubset.h"
#include "queso/GaussianVectorRV.h"
#include "queso/GaussianVectorRealizer.h"

int main(int argc, char * argv[])
{  
  if (argc != 4)
  {
    std::cerr <<"3 arguments required ./generate_data dim cat_model temp, found " <<(argc-1) <<std::endl;
    return -1;
  }
  
  std::string dim = argv[1];
  std::string cat_model = argv[2];
  std::string temp = argv[3];
  unsigned int n_data = 1;
  
  std::string input_filename = "./"+dim+"d/"+cat_model+"/"+temp+".in";
  std::string data_filename = "./"+dim+"d/"+cat_model+"/noisy_data/noisy_"+temp+".dat";

  std::ofstream output_file;
  output_file.open(data_filename);

  MPI_Init(&argc,&argv);

    std::cout <<"Starting GRINS run" <<std::endl;

      char * arv[] = {
                      (char*)"",
                      (char*)input_filename.c_str(),
                      (char*)"-ksp_type",
                      (char*)"preonly",
                      (char*)"-pc_type",
                      (char*)"lu",
                      (char*)"-pc_factor_mat_solver_package",
                      (char*)"mumps",
                      (char*)"--warn-only-unused-var"
                     };

      GRINS::Runner runner(9,arv);
      runner.init();
      runner.run();
      
    std::cout <<"Ending GRINS run" <<std::endl;
    
    std::cout <<"Starting QUESO stuff" <<std::endl;
    // now add some noise
      QUESO::FullEnvironment env(MPI_COMM_WORLD,"", "", NULL); // TODO

      QUESO::VectorSpace<> param_space( env, "param_", 1, NULL );

      QUESO::GslVector min_val( param_space.zeroVector() );
      min_val.cwSet(-1.0e-2);
      
      QUESO::GslVector max_val( param_space.zeroVector() );
      max_val.cwSet(1.0e-2);
      
      QUESO::GslVector mean( param_space.zeroVector() );
      mean.cwSet(0);
      
      double sigma = 2.50e-3; // JTHT paper envelope
      QUESO::GslVector var( param_space.zeroVector() );
      var.cwSet(sigma*sigma);
      
      QUESO::BoxSubset<> param_domain( "param_domain_", param_space, min_val, max_val );
      
      QUESO::GaussianVectorRV<> gauss_rv( "noise_", param_domain, mean, var );

      libMesh::Real qoi_value = runner.get_simulation().get_qoi_value(0);
        
      QUESO::GslVector sample( param_space.zeroVector() );
      
      if (env.fullRank() == 0)
        std::cout <<"Avengers, SAMPLE!!" <<std::endl;
        
      for (unsigned int s=0; s<n_data; ++s)
      {
        gauss_rv.realizer().realization(sample);
        libMesh::Real data_point = qoi_value + sample[0];
        output_file <<std::fixed <<std::setprecision(16) <<data_point <<std::endl;
      }
      
      if (env.fullRank() == 0)
        std::cout <<"Done sampling" <<std::endl;
  
      output_file.close();
      
      if (env.fullRank() == 0)
        std::cout <<"Done with e'ryting" <<std::endl;
    
  MPI_Finalize();

  return 0;
}
