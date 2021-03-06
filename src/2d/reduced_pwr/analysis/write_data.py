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

def write_data(filename):
  # Column 0: gamma
  h5_file = h5py.File(filename+'.h5', 'r')

  data = h5_file['/sub_0']

  gamma0_data = data[:,0]
  alpha_data = data[:,1]
  np.savetxt(filename+"_gamma0.csv",gamma0_data)  np.savetxt(filename+"_alpha.csv",alpha_data)
