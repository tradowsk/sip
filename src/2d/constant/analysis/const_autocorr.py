#!/usr/bin/python

import sys
import os
import glob

from mpl_toolkits.mplot3d import Axes3D
import matplotlib
from matplotlib import rc

matplotlib.rcParams['path.simplify'] = True
rc('text',usetex=True)

# Different modes
# By default, you can "show()" the figure which gives you an interactive window
# and it will save a .png when you call savefig().
# PDF produces a .pdf file, but show() doesn't seem to work.
#matplotlib.use("PDF")

import matplotlib.pyplot as plot
import numpy as np
from scipy.stats import gaussian_kde
import h5py

def const_acorr(filename):
  # Column 0: gamma
  h5_file = h5py.File(filename, 'r')

  print("Reading Data")
  gamma_data = h5_file['/sub_0']

  burnin_length = 100000
  sample_length = 1000

  tick_label_fontsize=18
  axis_label_fontsize=18
  matplotlib.rc('xtick', labelsize=tick_label_fontsize )
  matplotlib.rc(('xtick.major','xtick.minor'),  pad=10)
  matplotlib.rc('ytick', labelsize=tick_label_fontsize)

  # gamma_N_mean = np.zeros(gamma_N_sub_data.size)
  # gamma_CN_mean = np.zeros(gamma_CN_sub_data.size)

  # for i in xrange(gamma_N_sub_data.size):
  #     gamma_N_mean[i] = np.mean(gamma_N_sub_data[0:i])
  #     gamma_CN_mean[i] = np.mean(gamma_CN_sub_data[0:i])

#  fig = plot.figure()
#  ax1 = fig.add_subplot(111)

#  gn = ax1.set_xlabel( "Sample Number", fontsize=axis_label_fontsize)
  # gcn = ax1.set_ylabel( "Average", fontsize=axis_label_fontsize)

#  ax1.plot(gamma_data[burnin_length:],linestyle='-',color='blue',lw=2,label=r"$\gamma$")
  # ax1.plot(gamma_CN_mean,linestyle='-',color='red',lw=2,label=r"$\log_{10}\gamma_{CN}$")

  # handles, labels = ax1.get_legend_handles_labels()
  # ax1.legend(handles, labels)

#  ax1.grid(True)

  # fig.savefig("M1_running_avg.pdf", bbox_inches='tight')

  #Autocorrelation
  gamma_sub_data=gamma_data[burnin_length:(burnin_length+sample_length)]

#  print(type(gamma_sub_data))

  fig2 = plot.figure()
  ax2 = fig2.add_subplot(111)

  ax2.set_xlabel( "Sample Number", fontsize=axis_label_fontsize)
  ax2.set_ylabel( "Autocorrelation", fontsize=axis_label_fontsize)

  gcn = ax2.acorr(gamma_sub_data[:,0]-np.mean(gamma_data[burnin_length:]), usevlines=False, maxlags=None, normed=True, lw=2, linestyle='-', marker='.',color='red', label=r"$\gamma$")

  ax2.set_xbound(lower=0, upper=225)

  handles2, labels2 = ax2.get_legend_handles_labels()
  ax2.legend(handles2, labels2)

  ax2.grid(True)

  # fig2.savefig("M1_autocorr.pdf", bbox_inches='tight')

  plot.show()
