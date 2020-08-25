# -*- coding: utf-8 -*-
"""
Created on Tue May 19 15:47:01 2020

@author: harshws
"""
import matplotlib.pyplot as plt
import numpy as np

#load variable
n=32
z2 =np.linspace(-1,1,n)
z3= np.array([14,16,18,20,22])
z= z2[z3]


fig = plt.figure(figsize=[10,20])

nt=5
for i in range(nt):
    k=i+1;
    plt.subplot(nt,3,3*(i)+1)
    plt.imshow(F_ori1[:,:,z3[i]])
    #plt.title('')
    plt.axis('off')
   # plt.title('original phantom at z=',z[i])
    plt.subplot(nt,3, 3*(i)+2)
    plt.imshow(F_rep1[:,:,z3[i]]) 
    #plt.text('B')
    plt.axis('off')
    #plt.title('Blob representation at z=',z[i])
    plt.subplot(nt,3, 3*(i)+3)
    plt.imshow(F_rec1[:,:,z3[i]])
    #plt.text('C')
    plt.axis('off')       
    #plt.title('original phantom at z=',z[i])   
plt.savefig('im1.jpg')         
 
