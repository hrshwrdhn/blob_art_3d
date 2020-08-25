%calculate projection using blob
clc
clear
close all;
load 'workspace/pos_tx_rx_gamma.mat'   % load angle pos tx rx gamma
load 'workspace/mat_input.mat' % n_xgrid spacing_grid beta
load  'workspace/coeff_bccgrid.mat' % bccgridvector cn
 % source (ptx pty ptz)
 % detector (pdx pdy pdz)
addpath functions
 load 'workspace/proj_bcc_true.mat' % proj_bcctrue %trueprojection 
 g_vector = zeros(length(cn),1);
 [radius_blob,alpha_blob,m]= blob_input(spacing_grid);
 proj_bccblob=zeros(length(gamma),1);
 parfor i=1:length(gamma)
 %source coordinates
    x1=txpos(i,1);
    y1=txpos(i,2);
    z1=txpos(i,3);
    % detector coordinates
    x2=rxpos(i,1);
    y2=rxpos(i,2);
    z2=rxpos(i,3);
 [aij]=proj_bcc_ai( bccgridvector,x1,y1,z1,x2,y2,z2,m,radius_blob,alpha_blob);
 proj_bccblob(i)=sum( aij.*cn);
end
save 'workspace/proj_bcc_blob.mat' proj_bccblob

