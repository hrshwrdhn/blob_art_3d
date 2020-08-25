function ptpad= bccgrid_padding(n_xgrid,radius_blob)
 % create bcc frid with proper padding
 % size of phantom in sc is n*n*n
 del=2/(n_xgrid-1);   %sampling points periods in sc
 beta= del/sqrt(2);   % sampling distance in bcc
 nrange= 2*(length(0:beta:(1+radius_blob-.0001)) ) + 1 ;
 %npad= ceil(a_blob/beta);
 %nxb= ceil((2+2*(a) )/beta);
 %nb= (nxb-1)/2;
if (nrange-1)/2 == 0
     oddint=  -1*((nrange-1)/2  - 1 ): 2 : (nrange-1)/2  - 1 ;
     evenint=  -1*(nrange-1)/2  :2:(nrange-1)/2   ;
 else
    evenint=  -1*((nrange-1)/2  - 1 ): 2 : (nrange-1)/2  - 1 ;
    oddint=  -1*(nrange-1)/2  :2:(nrange-1)/2   ;
 end
 xe= evenint*beta;
 xo= oddint*beta;

 [X1, Y1, Z1]=meshgrid(xe,xe,xe);
 pt1= [X1(:),Y1(:),Z1(:)];
 [X2, Y2, Z2]=meshgrid(xo,xo,xo);
 pt2= [X2(:),Y2(:),Z2(:)];
 ptpad= [pt1; pt2];   %grid unmaped

end
