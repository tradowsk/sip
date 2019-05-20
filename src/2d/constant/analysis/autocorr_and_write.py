#!/usr/bin/python

import sys
import os
import glob

from mpl_toolkits.mplot3d import Axes3D
import matplotlib
from matplotlib import rc

matplotlib.rcParams['path.simplify'] = True
rc('text',usetex=True)

import matplotlib.pyplot as plot
import numpy as np
from scipy.stats import gaussian_kde
import h5py

def acorr_and_write(filename):
  h5_file = h5py.File(filename+".h5", 'r')

  gamma_data = h5_file['/sub_0']

  np.savetxt(filename+".csv",gamma_data)

  burnin_length = 100000
  sample_length = 1000

  tick_label_fontsize=18
  axis_label_fontsize=18
  matplotlib.rc('xtick', labelsize=tick_label_fontsize )
  matplotlib.rc(('xtick.major','xtick.minor'),  pad=10)
  matplotlib.rc('ytick', labelsize=tick_label_fontsize)

  gamma_sub_data=gamma_data[burnin_length:(burnin_length+sample_length)]

  fig2 = plot.figure()
  ax2 = fig2.add_subplot(111)

  ax2.set_xlabel( "Sample Number", fontsize=axis_label_fontsize)
  ax2.set_ylabel( "Autocorrelation", fontsize=axis_label_fontsize)

  gcn = ax2.acorr(gamma_sub_data[:,0]-np.mean(gamma_data[burnin_length:]), usevlines=False, maxlags=None, normed=True, lw=2, linestyle='-', marker='.',color='red', label=r"$\gamma$")

  ax2.set_xbound(lower=0, upper=225)

  handles2, labels2 = ax2.get_legend_handles_labels()
  ax2.legend(handles2, labels2)

  ax2.grid(True)

  plot.show()
