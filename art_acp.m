clc
clear
close all;
addpath functions
load 'workspace/proj_bcc_true.mat' % proj_bcctrue %trueprojection
load 'workspace/mat_input.mat' % n_xgrid spacing_grid beta
load 'workspace/pos_tx_rx_gamma.mat' % txpos rxpos gamma ang
load 'workspace/coeff_bccgrid.mat' bccgridvector cn
% source (ptx pty ptz)
% detector (pdx pdy pdz)
load 'workspace/proj_bcc_true.mat' % proj_bcctrue %trueprojection i.e. analytic formula %script__savetrueprojection.m
%calling blob parameter
[radius_blob,alpha_blob,m]= blob_input(spacing_grid);

nang = length(ang);
ndetector = length(gamma)/length(ang);
tic

gn2 = zeros(length(cn),1);

n_iter=10; % no. of iteration
lse2= zeros(nang*n_iter,1);
for iter = 1:n_iter
for  j= 1: nang
    corr = zeros(length(cn),1);
for k=1:ndetector
    i = (j-1)*ndetector + k;
  
    %source coordinates
    x1=txpos(i,1);
    y1=txpos(i,2);
    z1=txpos(i,3);
    % detector coordinates
    x2=rxpos(i,1);
    y2=rxpos(i,2);
    z2=rxpos(i,3);
    
    % true projection value
    
    trueprojection = proj_bcctrue(i);
    
  [ai] = proj_bcc_ai( bccgridvector,x1,y1,z1,x2,y2,z2,m,radius_blob,alpha_blob);
    
    %  [aij, proj_blobgrid]=fun_proj_blobgrid(cn,pt,x1,y1,z1,x2,y2,z2);
    if  ai'*ai >.001
        corr = corr + ai * ( trueprojection - gn2'*ai )./ (ai'*ai) ;
    end
    
    
    
end
gn2 = gn2 + corr/ndetector;
lse2(j + nang*(iter-1))  = norm(gn2-cn);
toc
end
end
save 'workspace/art_acpoutput1.mat' gn2 lse2
%15707
