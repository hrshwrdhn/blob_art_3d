function im1_rep = img_blobrep(bccgridvector,scgridvector,cn,m,alpha_blob,radius_blob)
% generate image on bcc grid
len = length(scgridvector(:,1));
im1_rep = zeros(len,1);
 parfor i = 1: len
    x1= scgridvector(i,1);
    y1= scgridvector(i,2);
    z1= scgridvector(i,3);
    d=   sqrt(   (bccgridvector(:,1)-x1).^2 + (y1-bccgridvector(:,2)).^2 + (z1-bccgridvector(:,3)).^2  );
    ind=find(d<radius_blob);
    im1_rep(i) = sum( blobfnval(m,radius_blob,alpha_blob,d(ind)) .* (cn(ind)) ) ;
 end
end
