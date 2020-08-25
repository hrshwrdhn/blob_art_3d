%calculate projection using line integral
clc
clear
close all;
load 'workspace/pos_tx_rx_gamma.mat'   % load angle pos tx rx gamma
load 'workspace/mat_input.mat' % n_xgrid spacing_grid beta
load  'workspace/coeff_bccgrid.mat' % bccgridvector cn
% source (ptx pty ptz)
% detector (pdx pdy pdz)
g_vector = zeros(length(cn),1);
[radius_blob,alpha_blob,m]= blob_input(spacing_grid);
proj_bcctrue= zeros(length(gamma),1);
parfor i=1:length(gamma)
  
    x1=txpos(i,1);
    y1=txpos(i,2);
    z1=txpos(i,3);
    % detector coordinates
    x2=rxpos(i,1);
    y2=rxpos(i,2);
    z2=rxpos(i,3);
    % true projection value
    proj_bcctrue(i) = proj_ellipsoid(x1,y1,z1,x2,y2,z2);
   %[aij, proj_bccblob(i)]=fun_proj_blobgrid(cn,pt,x1,y1,z1,x2,y2,z2);

end 
save 'workspace/proj_bcc_true.mat'  proj_bcctrue

