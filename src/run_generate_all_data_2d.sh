mpiexec -np 16 ./generate_data 2 constant 600
mpiexec -np 16 ./generate_data 2 constant 800
mpiexec -np 16 ./generate_data 2 constant 1000
mpiexec -np 16 ./generate_data 2 constant 1200

mpiexec -np 16 ./generate_data 2 arrhenius 600
mpiexec -np 16 ./generate_data 2 arrhenius 800
mpiexec -np 16 ./generate_data 2 arrhenius 1000
mpiexec -np 16 ./generate_data 2 arrhenius 1200

mpiexec -np 16 ./generate_data 2 pwr 600
mpiexec -np 16 ./generate_data 2 pwr 800
mpiexec -np 16 ./generate_data 2 pwr 1000
mpiexec -np 16 ./generate_data 2 pwr 1200

mpiexec -np 16 ./generate_data 2 reduced_arrhenius 600
mpiexec -np 16 ./generate_data 2 reduced_arrhenius 800
mpiexec -np 16 ./generate_data 2 reduced_arrhenius 1000
mpiexec -np 16 ./generate_data 2 reduced_arrhenius 1200

mpiexec -np 16 ./generate_data 2 reduced_pwr 600
mpiexec -np 16 ./generate_data 2 reduced_pwr 800
mpiexec -np 16 ./generate_data 2 reduced_pwr 1000
mpiexec -np 16 ./generate_data 2 reduced_pwr 1200
