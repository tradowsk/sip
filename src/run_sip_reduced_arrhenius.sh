rm 2d/reduced_arrhenius/queso_data/*


##############################################
## Base case
# 800-15-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset30/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset30/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 800
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/800-15-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/800-15-01_like.h5


##############################################
## Plot 1
# 800-30-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset45/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset45/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 800
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/800-30-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/800-30-01_like.h5

# 800-85-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset100/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset100/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 800
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/800-85-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/800-85-01_like.h5


##############################################
## Plot 2
# 800-15-02
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/xo02/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/xo02/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 800
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/800-15-02.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/800-15-02_like.h5

# 800-15-001
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/xo001/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/xo001/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 800
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/800-15-001.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/800-15-001_like.h5


##############################################
## Plot 3
# 600-15-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset30/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset30/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 600
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/600-15-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/600-15-01_like.h5

# 1000-15-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset30/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset30/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 1000
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/1000-15-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/1000-15-01_like.h5

# 1200-15-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset30/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset30/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 1200
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/1200-15-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/1200-15-01_like.h5


##############################################
## Plot 4
# 600_800-15-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset30/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset30/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 600 800
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/600_800-15-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/600_800-15-01_like.h5

# 600_800_1000-15-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset30/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset30/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 600 800 1000
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/600_800_1000-15-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/600_800_1000-15-01_like.h5

# 600_800_1000_1200-15-01
rm 2d/reduced_arrhenius/noisy_data/* 2d/reduced_arrhenius/surrogate_data/*

cp 2d/reduced_arrhenius/low_noise_data/offset30/* 2d/reduced_arrhenius/noisy_data/
cp 2d/reduced_arrhenius/surrogates/offset30/* 2d/reduced_arrhenius/surrogate_data/

rm redarr_queso_output/*
mpiexec -np 2 ./sip 2 reduced_arrhenius 600 800 1000 1200
cp redarr_queso_output/ip_raw_chain.h5 2d/reduced_arrhenius/queso_data/600_800_1000_1200-15-01.h5
cp redarr_queso_output/ip_raw_chain_loglikelihood.h5 2d/reduced_arrhenius/queso_data/600_800_1000_1200-15-01_like.h5

