import matplotlib.pyplot as plt
import numpy as np
import csv

from mpl_toolkits.mplot3d import Axes3D
import matplotlib
from matplotlib import rc

matplotlib.rcParams['path.simplify'] = True
rc('text',usetex=True)

def readFromCSV(filename):
  nu = []
  absorption = []
  with open(filename,'r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',', quoting=csv.QUOTE_NONNUMERIC)
    for row in plots:
        nu.append(row[0])
        absorption.append(row[1])
  return nu,absorption

refx = [0.08,0.08];
refy = [0.0,1.1];

base_x,base_y = readFromCSV('./800-L-30-01_posterior.csv')

#med_x,med_y   = readFromCSV('./800-M-30-01_posterior.csv')
#high_x,high_y = readFromCSV('./800-H-30-01_posterior.csv')

off45_x,off45_y = readFromCSV('./800-L-45-01_posterior.csv')
off100_x,off100_y = readFromCSV('./800-L-100-01_posterior.csv')

xo02_x,xo02_y = readFromCSV('./800-L-30-02_posterior.csv')
xo001_x,xo001_y = readFromCSV('./800-L-30-001_posterior.csv')

l600_x,l600_y = readFromCSV('./600-L-30-01_posterior.csv')
l1000_x,l1000_y = readFromCSV('./1000-L-30-01_posterior.csv')
l1200_x,l1200_y = readFromCSV('./1200-L-30-01_posterior.csv')

l68_x,l68_y = readFromCSV('./600_800-L-30-01_posterior.csv')
l6810_x,l6810_y = readFromCSV('./600_800_1000-L-30-01_posterior.csv')
l681012_x,l681012_y = readFromCSV('./600_800_1000_1200-L-30-01_posterior.csv')


#ticks = np.linspace(2172.745,2172.775,7)

tick_label_fontsize=22
axis_label_fontsize=22
matplotlib.rc('xtick', labelsize=tick_label_fontsize )
matplotlib.rc(('xtick.major','xtick.minor'),  pad=10)

####################################
## Noise Plot
#fig1 = plt.figure(1)
#ax1 = fig1.add_subplot(111)
#ax1.set_xlabel( "$\gamma$", fontsize=axis_label_fontsize)
#ax1.axes.get_yaxis().set_visible(False)
#plt.plot(refx,refy,color='magenta')
#plt.plot(base_x,base_y,label='Low Noise',color='#364252')
#plt.plot(med_x,med_y,label='Medium Noise',color='#0099fb')
#plt.plot(high_x,high_y,label='High Noise',color='#2bdc49')
#plt.legend(fontsize=14)
#plt.ylim([0,1.1])
#plt.tight_layout()
#plt.savefig('./figs/const_noise.pdf')


####################################
## Offset Plot
fig2 = plt.figure(2)
ax2 = fig2.add_subplot(111)
ax2.set_xlabel( "$\gamma$", fontsize=axis_label_fontsize)
ax2.axes.get_yaxis().set_visible(False)
plt.plot(refx,refy,color='magenta')
plt.plot(base_x,base_y,label='Offset 1.5mm',color='#364252')
plt.plot(off45_x,off45_y,label='Offset 3.0mm',color='#0099fb')
plt.plot(off100_x,off100_y,label='Offset 8.5mm',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0.06,0.105])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/const_offset.pdf')


####################################
## Xo Plot
fig3 = plt.figure(3)
ax3 = fig3.add_subplot(111)
ax3.set_xlabel( "$\gamma$", fontsize=axis_label_fontsize)
ax3.axes.get_yaxis().set_visible(False)
plt.plot(refx,refy,color='magenta')
plt.plot(base_x,base_y,label='$X_o = 1.0\%$',color='#364252')
plt.plot(xo02_x,xo02_y,label='$X_o = 2.0\%$',color='#0099fb')
#plt.plot(xo001_x,xo001_y,label='$X_o = 0.1\%$',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0.06,0.105])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/const_xo.pdf')


####################################
## Temperature Plot
fig4 = plt.figure(4)
ax4 = fig4.add_subplot(111)
ax4.set_xlabel( "$\gamma$", fontsize=axis_label_fontsize)
ax4.axes.get_yaxis().set_visible(False)
plt.plot(refx,refy,color='magenta')
plt.plot(l600_x,l600_y,label='600K',color='#ff4054')
plt.plot(base_x,base_y,label='800K',color='#364252')
plt.plot(l1000_x,l1000_y,label='1000K',color='#0099fb')
plt.plot(l1200_x,l1200_y,label='1200K',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0.06,0.105])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/const_temp.pdf')


####################################
## Data Plot
fig5 = plt.figure(5)
ax5 = fig5.add_subplot(111)
ax5.set_xlabel( "$\gamma$", fontsize=axis_label_fontsize)
ax5.axes.get_yaxis().set_visible(False)
plt.plot(refx,refy,color='magenta')
plt.plot(l600_x,l600_y,label='1 Temperature',color='#ff4054')
plt.plot(l68_x,l68_y,label='2 Temperatures',color='#364252')
plt.plot(l6810_x,l6810_y,label='3 Temperatures',color='#0099fb')
plt.plot(l681012_x,l681012_y,label='4 Temperatures',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0.06,0.105])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/const_data.pdf')


plt.show()

