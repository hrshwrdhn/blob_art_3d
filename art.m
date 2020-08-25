% ART Algorithm script
% change n_glob_it - no. of ART iterations
clc
clear
close all;
 load 'workspace/proj_bcc_true.mat' % proj_bcctrue %trueprojection
 load 'workspace/mat_input.mat' % n_xgrid spacing_grid beta
 load 'workspace/pos_tx_rx_gamma.mat' % txpos rxpos gamma ang
 load 'workspace/coeff_bccgrid.mat' bccgridvector cn
% source (ptx pty ptz)
% detector (pdx pdy pdz)
 load 'workspace/proj_bcc_true.mat' % proj_bcctrue %trueprojection i.e. analytic formula %script__savetrueprojection.m
%calling blob parameter
 [radius_blob,alpha_blob,m]= blob_input(spacing_grid);
tic
addpath functions
gn = zeros(length(cn),1);
 n_glob_it=1;  % no. of iteration
 lse= zeros(n_glob_it*length(gamma),1);
 for glob_it = 1: n_glob_it
   for i=1:length(gamma)
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
       if  ai'*ai >.001
          gn = gn + ai * ( trueprojection - gn'*ai )./ (ai'*ai) ;
       end
    lse((glob_it-1)*length(gamma)+ i) = norm(gn-cn);
   end
  end
save 'ws_art/artoutput_1.mat' gn lse
toc
