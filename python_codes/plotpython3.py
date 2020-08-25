# -*- coding: utf-8 -*-
"""
Created on Tue May 19 21:24:36 2020

@author: harshws
"""
import matplotlib.pyplot as plt
import numpy as np
nx=32;
d=np.linspace(-1,1,nx)

px=18;
py=16;
f1=F_ori1[:,px,py]
f2=F_rep1[:,px,py]
f3=F_rec1[:,px,py]

fig, ax = plt.subplots()  # Create a figure and an axes.
ax.plot(d,f1, label= r'Original') # Plot some data on the axes.
ax.plot(d,f2, label=r'Representation')  # Plot more data on the axes...
ax.plot(d,f3, label=r'Reconstruction')  # ... and some more.
ax.set_xlim([-1, 1])
ax.set_ylim([0, 2])

ax.set_ylabel(r'Amplitude')  # Add an x-label to the axes.
ax.set_xlabel('x')  # Add a y-label to the axes.
#ax.set_title(r'y =', d[px] ,'z = ',d[py])  # Add a title to the axes.
ax.legend()  # Add a legend.
plt.savefig('rec3.pdf')