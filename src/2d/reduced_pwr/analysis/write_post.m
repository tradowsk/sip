clearvars; close all; clc;

clearvars; close all; clc;

files = [ "600_800-L-30-01";
          "600_800-L-45-01";
          "600_800-L-100-01";
          "600_800-L-30-02";
          "600_800-L-30-001";
          "600_1000-L-30-01";
          "600_1200-L-30-01";
          "800_1000-L-30-01";
          "800_1200-L-30-01";
          "1000_1200-L-30-01";
          "600_800_1000-L-30-01";
          "600_800_1000_1200-L-30-01";
];

acorr = [ 80 81;
          95 97;
          67 69;
          50 50;
          40 32;
          48 47;
          22 22;
          50 44;
          75 75;
          112 100;
          56 53;
          27 28
];

means = zeros(length(acorr),2);
sigma = zeros(length(acorr),2);

burnin = 100000;

for i=1:length(files)
  close all; clear gh ah;

  filename = files(i);
  
  Mg = importdata(strcat(filename,'_gamma0.csv'));
  Ma = importdata(strcat(filename,'_alpha.csv'));
  gamma0 = Mg(burnin:acorr(i,1):end);
  alpha  = Ma(burnin:acorr(i,2):end);

  figure(1)
  gh = histfit(gamma0,50);
  means(i,1)  = mean(gamma0);
  sigma(i,1) = std(gamma0);
  xlabel('gamma0')

  gx = gh(2).XData;
  gy = gh(2).YData./max(gh(2).YData);

  figure(2)
  ah = histfit(alpha,50);
  means(i,2) = mean(alpha);
  sigma(i,2) = std(alpha);
  xlabel('alpha')

  ax = ah(2).XData;
  ay = ah(2).YData./max(ah(2).YData);

  dlmwrite(strcat(filename,'_gamma0_subsampled.csv'),gamma0,'precision','%.8f')
  dlmwrite(strcat(filename,'_alpha_subsampled.csv'),alpha,'precision','%.8f')
  dlmwrite(strcat(filename,'_gamma0_posterior.csv'),[gx' gy'],'precision','%.8f')
  dlmwrite(strcat(filename,'_alpha_posterior.csv'),[ax' ay'],'precision','%.8f')
  
  i
  
  pause
end
