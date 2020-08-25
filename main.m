%%%%%%%%%%%%%% main script %%%%%%%%%%%%%%%%%%%5%
% blob parameter and blob representation
%
addpath functions
%input | n_xgrid => no. of grid point in  x direction simple cubic arrangement
n_xgrid=32;

% total no. of grid are n_xgrid^3 = n_grid
spacing_grid=2/(n_xgrid-1);  % spaceing between two grid in simple cubic
beta= spacing_grid/sqrt(2);   % bcc spacing

% save input data
save 'workspace/mat_input.mat' n_xgrid spacing_grid beta

%calling blob parameter
[radius_blob,alpha_blob,m]= blob_input(spacing_grid);

[x,y,z] = meshgrid(-1:2/(n_xgrid-1):1,-1:2/(n_xgrid-1):1,-1:2/(n_xgrid-1):1);
scgridvector = [x(:),y(:),z(:)];      % sc grid vecor
imori= f3_imgvalgrid(scgridvector);
imori=reshape(imori,n_xgrid,n_xgrid,n_xgrid);

bccgridvector= bccgrid_padding(n_xgrid,radius_blob);  %BCC GRID with pad (x,y,z)
gbar= find_gaverage(spacing_grid);  %gbar is use to compute coeff. of basic functions
F_ori=f3_imgvalgrid(bccgridvector);   %representation using blob parameter
cn= (F_ori/gbar);    % cn is coefficient of blob function

save 'workspace/coeff_bccgrid.mat' bccgridvector cn

F_rep=  img_blobrep(bccgridvector,scgridvector,cn,m,alpha_blob,radius_blob);
save 'workspace/image_blob_rep.mat' F_rep
save 'workspace/image_ori.mat' F_ori

% rmse:      sqerror = norm(imori-F_rep) 
imori=reshape(imori,n_xgrid,n_xgrid,n_xgrid);
im_rep=reshape(F_rep,n_xgrid,n_xgrid,n_xgrid);


