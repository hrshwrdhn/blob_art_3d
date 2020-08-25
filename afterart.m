%after ART processing
%script for image representation
 addpath functions
 load 'workspace/mat_input.mat' n_xgrid spacing_grid beta
 n2=n_xgrid/2;
%calling blob parameter
 [radius_blob,alpha_blob,m]= blob_input(spacing_grid);
 [x,y,z] = meshgrid(-1:2/(n_xgrid-1):1,-1:2/(n_xgrid-1):1,-1:2/(n_xgrid-1):1);
 scgridvector = [x(:),y(:),z(:)];  % scgridvecor
 bccgridvector= bccgrid_padding(n_xgrid,radius_blob);  %BCC GRID with pad (x,y,z)
%%
 F_ori=f3_imgvalgrid(scgridvector);
 F_ori1=reshape(F_ori,n_xgrid,n_xgrid,n_xgrid);
 F_rep=  img_blobrep(bccgridvector,scgridvector,cn,m,alpha_blob,radius_blob);
 F_rep1=reshape(F_rep,n_xgrid,n_xgrid,n_xgrid);
 F_rec=  img_blobrep(bccgridvector,scgridvector,gn2,m,alpha_blob,radius_blob);
 F_rec1=reshape(F_rec,n_xgrid,n_xgrid,n_xgrid);
save 'fianloutput4.mat' F_rec1,F_ori1,F_rep1 lse2 
save -mat7-binary 'ws_acp/finalbinary.mat' F_rec1,F_ori1,F_rep1,lse2,gn2,cn,iter;

figure(1)
imshow(F_ori1(:,:,n2))
figure(2)
imshow(F_rep1(:,:,n2))
figure(3)
imshow(F_rec1(:,:,n2))
figure(4)
plot(lse2)

figure(5)
plot(F_ori1(16,:,16))
hold on
plot(F_rep1(16,:,16))
hold on
plot(F_rec1(16,:,16))
