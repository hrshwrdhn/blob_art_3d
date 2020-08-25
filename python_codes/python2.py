# -*- coding: utf-8 -*-
"""
Created on Tue May 19 18:12:49 2020

@author: harshws
"""
import matplotlib.pyplot as plt
import numpy as np

#load variable

lse3=lse2/len(cn)
lse4=np.zeros((51,1))
n_itr=np.arange(0,51)
lse4[0]= lse3[0]
for i in range(1,51):
    lse4[i]= lse3[50*i-1 ]
    
    
#fig = plt.figure()

fig, ax = plt.subplots()  # Create a figure and an axes.
ax.plot(n_itr,lse4)

#ax.set_xlim([0, 1.2])
ax.set_ylim([0, .0005])

ax.set_ylabel('Root mean square error')  # Add an x-label to the axes.
ax.set_xlabel('No. of iterations')  # Add a y-label to the axes.
#ax.set_title(r'Blob function ($m=2,a=1$)')  # Add a title to the axes.
ax.legend()  # Add a legend.
plt.savefig('lse.pdf')