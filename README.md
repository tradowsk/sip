# Statistical Inverse Problem code repository

*TODO: dissertation reference*

This repository holds all the code necessary to run statistical inverse problems to inform surface catalycity model parameters from simulated laser absorption spectroscopy measurements.

Required packages:
1. GCC
2. Autotools
3. MPICH
4. OpenBLAS
5. PETSc
6. HDF5
7. VTK
8. Boost
9. libMesh
10. GRINS
11. GSL
12. Antioch
13. GLPK
14. QUESO

With the packages loaded into `PATH` and `LD_LIBRARY_PATH` as needed by the `Makefile`, one can type `make` in the `src/` directory to build all executables.

## General Outline ##
1. Generate a noisy data point using `generate_data`
2. Generate statistical surrogate using `generate_surrogate`
3. Run `optimizer` with 1+ noisy data points
4. Run `sip` with 1+ noisy data points, trim and subsample rawChain, plot histogram to get posterior

## Executables ##

### generate_data ###
  - arguments: dimension catalycity_model temperature
  - example: `mpiexec -np 8 ./generate_data 2 reduced_arr 800`
     
    Generates a single noisy data point for a 2D mesh with the Reduced Arrhenius model for a furnace temperature of 800K

  - places data in `"./"+dim+"d/"+cat_model+"/noisy_data/noisy_"+temp+".dat"`

### generate_surrogate ###
  - arguments: dimension catalycity_model temperature
  - example: `mpiexec -np 8 ./generate_surrogate 2 constant 800`
     
    Generates a surrogate for a 2D mesh with the Constant model for a furnace temperature of 800K

  - places data in `"./"+dim+"d/"+cat_model+"/surrogate_data/surr_"+T+".dat"`

### optimizer ###
  - arguments: dimension catalycity_model temperatures
  - example: `mpiexec -np 8 ./optimizer 2 reduced_pwr 600 800`
     
    Solves optimization problem using Nelder-Mead for Reduced Power Law model paramaters using noisy data points for temperatures 600K and 800K

  - results printed on-screen

### sip ###
  - arguments: dimension catalycity_model temperatures
  - example: `mpiexec -np 8 ./sip 2 reduced_pwr 600 800 1000`
     
    Solves statistical inverse problem using Metropolis-Hastings for Reduced Power Law model paramaters using noisy data points at temperatures 600K, 800K, and 1000K

  - results printed on-screen


## Scripts ##

### run_generate_all_data_2d.h ###
  - Generates a single noisy data point for temperatures 600,800,1000,1200 K for all 5 catalycity models.
  - Data is output to the `2d/[cat_model]/noisy_data/` directories, where it should be copied to `2d/[cat_model]/low_noise_data/` as appropriate based on the `run_sip_[cat_model].sh` scripts. 
  - To change flow/laser conditions, edit `./2d/common_input/2d_common.in` as needed and then re-run this script. 

### run_sip_[cat_model].sh ###
  - Automates all runs of the `sip` executable to generate inverse problem rawChains that can be trimmed and subsampled using the scripts in the `2d/[cat_model]/analysis` directories.
  - Expectes data to be in `2d/[cat_model]/low_noise_data/{offset*,xo0*}/` and surrogates in `2d/[cat_model]/surrogates/{offset*,xo)*}/`
