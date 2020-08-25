function trueprojection = proj_ellipsoid(x1,y1,z1,x2,y2,z2)
%projection through elipse
% trueprojection = proj_ellipsoid(x1,y1,z1,x2,y2,z2)
% call parameter of phantom
 sheppmat = slphantom3_data();
 [sizexe,sizeye]=size(sheppmat);
 trueprojection=0;

 for i=1:sizexe
  a2= (sheppmat(i,2))^2;
  b2= (sheppmat(i,3))^2;
  c2= (sheppmat(i,4))^2;
  x0= sheppmat(i,5);
  y0= sheppmat(i,6);
  z0=sheppmat(i,7);
  beta= sheppmat(i,8);
  sb= sind(beta);
  cb = cosd(beta);
  k=sheppmat(i,1);
   cf1= (x2-x1)*cb + (y2-y1)*sb;
   cf2= (y2-y1)*cb - (x2-x1)*sb;
   cf3= (z2-z1);
   cg1= (x1-x0)*cb + (y1-y0)*sb;
   cg2= (y1-y0)*cb - (x1-x0)*sb;
   cg3= (z1-z0);
  A= b2*c2*(cf1^2) + a2*c2*(cf2^2) +b2*a2*(cf3^2) ;
  B= 2* ( b2*c2*cf1*cg1 + a2*c2*cf2*cg2 + a2*b2*cf3*cg3 ) ;
  C=  b2*c2*(cg1)^2 + a2*c2*(cg2^2) +b2*a2*(cg3^2) - a2*b2*c2; ;

  if (B^2 -4* A*C ) > 0
    trueprojection = trueprojection + k*( sqrt((B^2 - 4*A*C )/(A^2) )* sqrt( (x2-x1)^2+(y2-y1)^2+ (z2-z1)^2) );
  end

 end
end   
