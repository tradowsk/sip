clearvars; close all; clc;

files = [ "800-L-30-01";
          "800-L-45-01";
          "800-L-100-01";
          "800-L-30-02";
          "800-L-30-001";
          "600-L-30-01";
          "1000-L-30-01";
          "1200-L-30-01";
          "600_800-L-30-01";
          "600_800_1000-L-30-01";
          "600_800_1000_1200-L-30-01";
];

acorr = [ 27;
          24;
          17;
          58;
          5;
          10;
          6;
          14;
          10;
          31;
          58
];

means = zeros(length(acorr),1);
sigmas = zeros(length(acorr),1);

burnin = 100000;

for i=1:length(files)
  close all; clear h;
  filename = files(i);
  M = importdata(strcat(filename,".csv"));
  gamma0 = M(burnin:acorr(i):end);

  h = histfit(gamma0,50);
  means(i) = mean(gamma0);
  sigmas(i) = std(gamma0);
  xlabel('gamma0')

  x = h(2).XData;
  y = h(2).YData./max(h(2).YData);

  dlmwrite(strcat(filename,"_subsampled.csv"),gamma0,'precision','%.8f')
  dlmwrite(strcat(filename,"_posterior.csv"),[x' y'],'precision','%.8f')
  
  i
  
  pause
end
