rm 2d/constant/queso_data/*


##############################################
## Base case
# 800-15-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset30/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset30/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 800
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/800-15-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/800-15-01_like.h5


##############################################
## Plot 1
# 800-30-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset45/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset45/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 800
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/800-30-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/800-30-01_like.h5

# 800-85-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset100/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset100/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 800
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/800-85-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/800-85-01_like.h5


##############################################
## Plot 2
# 800-15-02
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/xo02/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/xo02/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 800
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/800-15-02.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/800-15-02_like.h5

# 800-15-001
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/xo001/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/xo001/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 800
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/800-15-001.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/800-15-001_like.h5


##############################################
## Plot 3
# 600-15-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset30/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset30/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 600
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/600-15-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/600-15-01_like.h5

# 1000-15-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset30/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset30/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 1000
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/1000-15-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/1000-15-01_like.h5

# 1200-15-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset30/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset30/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 1200
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/1200-15-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/1200-15-01_like.h5


##############################################
## Plot 4
# 600_800-15-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset30/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset30/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 600 800
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/600_800-15-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/600_800-15-01_like.h5

# 600_800_1000-15-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset30/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset30/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 600 800 1000
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/600_800_1000-15-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/600_800_1000-15-01_like.h5

# 600_800_1000_1200-15-01
rm 2d/constant/noisy_data/* 2d/constant/surrogate_data/*

cp 2d/constant/low_noise_data/offset30/* 2d/constant/noisy_data/
cp 2d/constant/surrogates/offset30/* 2d/constant/surrogate_data/

rm const_queso_output/*
mpiexec -np 2 ./sip 2 constant 600 800 1000 1200
cp const_queso_output/ip_raw_chain.h5 2d/constant/queso_data/600_800_1000_1200-15-01.h5
cp const_queso_output/ip_raw_chain_loglikelihood.h5 2d/constant/queso_data/600_800_1000_1200-15-01_like.h5

