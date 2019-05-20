rm 2d/reduced_pwr/queso_data/*

###############################################
## Base case
# 600_800-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 800
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_800-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_800-15-01_like.h5


##############################################
## Plot 1
# 600_800-30-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset45/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset45/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 800
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_800-30-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_800-30-01_like.h5

# 600_800-85-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset100/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset100/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 800
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_800-85-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_800-85-01_like.h5


#############################################
# Plot 2
# 600_800-15-02
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/xo02/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/xo02/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 800
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_800-15-02.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_800-15-02_like.h5

# 600_800-15-001
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/xo001/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/xo001/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 800
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_800-15-001.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_800-15-001_like.h5


##############################################
## Plot 3
# 600_1000-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 1000
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_1000-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_1000-15-01_like.h5

# 600_1200-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 1200
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_1200-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_1200-15-01_like.h5

# 800_1000-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 800 1000
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/800_1000-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/800_1000-15-01_like.h5

# 800_1200-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 800 1200
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/800_1200-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/800_1200-15-01_like.h5

# 1000_1200-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 1000 1200
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/1000_1200-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/1000_1200-15-01_like.h5


##############################################
## Plot 4
# 600_800_1000-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 800 1000
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_800_1000-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_800_1000-15-01_like.h5

# 600_800_1000_1200-15-01
rm 2d/reduced_pwr/noisy_data/* 2d/reduced_pwr/surrogate_data/*

cp 2d/reduced_pwr/low_noise_data/offset30/* 2d/reduced_pwr/noisy_data/
cp 2d/reduced_pwr/surrogates/offset30/* 2d/reduced_pwr/surrogate_data/

rm redpwr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_pwr 600 800 1000 1200
cp redpwr_queso_output/ip_raw_chain.h5 2d/reduced_pwr/queso_data/600_800_1000_1200-15-01.h5
cp redpwr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_pwr/queso_data/600_800_1000_1200-15-01_like.h5

