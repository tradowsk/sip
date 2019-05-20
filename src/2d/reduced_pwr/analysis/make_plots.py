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

grefx = [0.218,0.218];
grefy = [0.0,1.1];

gbase_x,gbase_y = readFromCSV('./600_800-L-30-01_gamma0_posterior.csv')

#gmed_x,gmed_y   = readFromCSV('./600_800-M-30-01_gamma0_posterior.csv')
#ghigh_x,ghigh_y = readFromCSV('./600_800-H-30-01_gamma0_posterior.csv')

goff45_x,goff45_y = readFromCSV('./600_800-L-45-01_gamma0_posterior.csv')
goff100_x,goff100_y = readFromCSV('./600_800-L-100-01_gamma0_posterior.csv')

gxo02_x,gxo02_y = readFromCSV('./600_800-L-30-02_gamma0_posterior.csv')
gxo001_x,gxo001_y = readFromCSV('./600_800-L-30-001_gamma0_posterior.csv')

g610_x,g610_y = readFromCSV('./600_1000-L-30-01_gamma0_posterior.csv')
g612_x,g612_y = readFromCSV('./600_1200-L-30-01_gamma0_posterior.csv')
g810_x,g810_y = readFromCSV('./800_1000-L-30-01_gamma0_posterior.csv')
g812_x,g812_y = readFromCSV('./800_1200-L-30-01_gamma0_posterior.csv')
g1012_x,g1012_y = readFromCSV('./1000_1200-L-30-01_gamma0_posterior.csv')

g6810_x,g6810_y = readFromCSV('./600_800_1000-L-30-01_gamma0_posterior.csv')
g681012_x,g681012_y = readFromCSV('./600_800_1000_1200-L-30-01_gamma0_posterior.csv')

arefx = [-0.933,-0.933];
arefy = [0.0,1.1];

abase_x,abase_y = readFromCSV('./600_800-L-30-01_alpha_posterior.csv')

#amed_x,amed_y   = readFromCSV('./600_800-M-30-01_alpha_posterior.csv')
#ahigh_x,ahigh_y = readFromCSV('./600_800-H-30-01_alpha_posterior.csv')

aoff45_x,aoff45_y = readFromCSV('./600_800-L-45-01_alpha_posterior.csv')
aoff100_x,aoff100_y = readFromCSV('./600_800-L-100-01_alpha_posterior.csv')

axo02_x,axo02_y = readFromCSV('./600_800-L-30-02_alpha_posterior.csv')
axo001_x,axo001_y = readFromCSV('./600_800-L-30-001_alpha_posterior.csv')

a610_x,a610_y = readFromCSV('./600_1000-L-30-01_alpha_posterior.csv')
a612_x,a612_y = readFromCSV('./600_1200-L-30-01_alpha_posterior.csv')
a810_x,a810_y = readFromCSV('./800_1000-L-30-01_alpha_posterior.csv')
a812_x,a812_y = readFromCSV('./800_1200-L-30-01_alpha_posterior.csv')
a1012_x,a1012_y = readFromCSV('./1000_1200-L-30-01_alpha_posterior.csv')

a6810_x,a6810_y = readFromCSV('./600_800_1000-L-30-01_alpha_posterior.csv')
a681012_x,a681012_y = readFromCSV('./600_800_1000_1200-L-30-01_alpha_posterior.csv')


#ticks = np.linspace(2172.745,2172.775,7)

tick_label_fontsize=22
axis_label_fontsize=22
matplotlib.rc('xtick', labelsize=tick_label_fontsize )
matplotlib.rc(('xtick.major','xtick.minor'),  pad=10)

####################################
## Noise Plots
#fig1 = plt.figure(1)
#ax1 = fig1.add_subplot(111)
#ax1.set_xlabel( "$\gamma_o$", fontsize=axis_label_fontsize)
#ax1.axes.get_yaxis().set_visible(False)
#plt.plot(grefx,grefy,color='magenta')
#plt.plot(gbase_x,gbase_y,label='Low Noise',color='#364252')
#plt.plot(gmed_x,gmed_y,label='Medium Noise',color='#0099fb')
#plt.plot(ghigh_x,ghigh_y,label='High Noise',color='#2bdc49')
#plt.legend(fontsize=14)
#plt.ylim([0,1.1])
#plt.tight_layout()
#plt.savefig('./figs/redpwr_noise_gamma0.pdf')

#fig2 = plt.figure(2)
#ax2 = fig2.add_subplot(111)
#ax2.set_xlabel( "$\\alpha$", fontsize=axis_label_fontsize)
#ax2.axes.get_yaxis().set_visible(False)
#plt.plot(arefx,arefy,color='magenta')
#plt.plot(abase_x,abase_y,label='Low Noise',color='#364252')
#plt.plot(amed_x,amed_y,label='Medium Noise',color='#0099fb')
#plt.plot(ahigh_x,ahigh_y,label='High Noise',color='#2bdc49')
#plt.legend(fontsize=14)
#plt.ylim([0,1.1])
#plt.tight_layout()
#plt.savefig('./figs/redpwr_noise_alpha.pdf')


####################################
## Offset Plots
fig3 = plt.figure(3)
ax3 = fig3.add_subplot(111)
ax3.set_xlabel( "$\gamma_o$", fontsize=axis_label_fontsize)
ax3.axes.get_yaxis().set_visible(False)
plt.plot(grefx,grefy,color='magenta')
plt.plot(gbase_x,gbase_y,label='Offset 1.5mm',color='#364252')
plt.plot(goff45_x,goff45_y,label='Offset 3.0mm',color='#0099fb')
plt.plot(goff100_x,goff100_y,label='Offset 8.5mm',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0,0.6])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_offset_gamma0.pdf')

fig4 = plt.figure(4)
ax4 = fig4.add_subplot(111)
ax4.set_xlabel( "$\\alpha$", fontsize=axis_label_fontsize)
ax4.axes.get_yaxis().set_visible(False)
plt.plot(arefx,arefy,color='magenta')
plt.plot(abase_x,abase_y,label='Offset 1.5mm',color='#364252')
plt.plot(aoff45_x,aoff45_y,label='Offset 3.0mm',color='#0099fb')
plt.plot(aoff100_x,aoff100_y,label='Offset 8.5mm',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([-2.0,0.0])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_offset_alpha.pdf')


####################################
## Xo Plots
fig5 = plt.figure(5)
ax5 = fig5.add_subplot(111)
ax5.set_xlabel( "$\gamma_o$", fontsize=axis_label_fontsize)
ax5.axes.get_yaxis().set_visible(False)
plt.plot(grefx,grefy,color='magenta')
plt.plot(gbase_x,gbase_y,label='$X_o = 1.0\%$',color='#364252')
plt.plot(gxo02_x,gxo02_y,label='$X_o = 2.0\%$',color='#0099fb')
#plt.plot(gxo001_x,gxo001_y,label='$X_o = 0.1\%$',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0,0.6])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_xo_gamma0.pdf')

fig6 = plt.figure(6)
ax6 = fig6.add_subplot(111)
ax6.set_xlabel( "$\\alpha$", fontsize=axis_label_fontsize)
ax6.axes.get_yaxis().set_visible(False)
plt.plot(arefx,arefy,color='magenta')
plt.plot(abase_x,abase_y,label='$X_o = 1.0\%$',color='#364252')
plt.plot(axo02_x,axo02_y,label='$X_o = 2.0\%$',color='#0099fb')
plt.plot(axo001_x,axo001_y,label='$X_o = 0.1\%$',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([-2.0,0.0])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_xo_alpha.pdf')


####################################
## Temperature Plots
fig7 = plt.figure(7)
ax7 = fig7.add_subplot(111)
ax7.set_xlabel( "$\gamma_o$", fontsize=axis_label_fontsize)
ax7.axes.get_yaxis().set_visible(False)
plt.plot(grefx,grefy,color='magenta')
plt.plot(gbase_x,gbase_y,label='600,800',color='#364252')
plt.plot(g610_x,g610_y,label='600,1000',color='#ff4054')
plt.plot(g612_x,g612_y,label='600,1200',color='#e8d113')
plt.plot(g810_x,g810_y,label='800,1000',color='#0099fb')
plt.plot(g812_x,g812_y,label='800,1200',color='#aaaaaa')
plt.plot(g1012_x,g1012_y,label='1000,1200',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0,0.6])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_temp_gamma0.pdf')

fig8 = plt.figure(8)
ax8 = fig8.add_subplot(111)
ax8.set_xlabel( "$\\alpha$", fontsize=axis_label_fontsize)
ax8.axes.get_yaxis().set_visible(False)
plt.plot(arefx,arefy,color='magenta')
plt.plot(abase_x,abase_y,label='600,800',color='#364252')
plt.plot(a610_x,a610_y,label='600,1000',color='#ff4054')
plt.plot(a612_x,a612_y,label='600,1200',color='#e8d113')
plt.plot(a810_x,a810_y,label='800,1000',color='#0099fb')
plt.plot(a812_x,a812_y,label='800,1200',color='#aaaaaa')
plt.plot(a1012_x,a1012_y,label='1000,1200',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([-2.0,0.0])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_temp_alpha.pdf')


####################################
## Data Plots
fig9 = plt.figure(9)
ax9 = fig9.add_subplot(111)
ax9.set_xlabel( "$\gamma_o$", fontsize=axis_label_fontsize)
ax9.axes.get_yaxis().set_visible(False)
plt.plot(grefx,grefy,color='magenta')
plt.plot(gbase_x,gbase_y,label='2 Temperatures',color='#364252')
plt.plot(g6810_x,g6810_y,label='3 Temperatures',color='#0099fb')
plt.plot(g681012_x,g681012_y,label='4 Temperatures',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([0,0.6])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_data_gamma0.pdf')

fig10 = plt.figure(10)
ax10 = fig10.add_subplot(111)
ax10.set_xlabel( "$\\alpha$", fontsize=axis_label_fontsize)
ax10.axes.get_yaxis().set_visible(False)
plt.plot(arefx,arefy,color='magenta')
plt.plot(abase_x,abase_y,label='2 Temperatures',color='#364252')
plt.plot(a6810_x,a6810_y,label='3 Temperatures',color='#0099fb')
plt.plot(a681012_x,a681012_y,label='4 Temperatures',color='#2bdc49')
plt.legend(fontsize=14)
plt.xlim([-2.0,0.0])
plt.ylim([0,1.1])
plt.tight_layout()
plt.savefig('./figs/redpwr_data_alpha.pdf')


plt.show()

