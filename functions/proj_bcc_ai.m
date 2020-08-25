function [aij]=proj_bcc_ai(bccgridvector,x1,y1,z1,x2,y2,z2,m,radius_blob,alpha_blob)
 %[aij]=proj_bcc_ai(bccgridvector,x1,y1,z1,x2,y2,z2,m,radius_blob,alpha_blob)
 % aij = weighting matrix of a ray
 % m,radius_blob,alpha_blob = blob parameters
 % x1,y1,z1,x2,y2,z2 Tx Rx coordinates
 x= bccgridvector(:,1);
 y= bccgridvector(:,2);
 z = bccgridvector(:,3);
 vec_ray= [x1 y1 z1]'-[x2 y2 z2]'; 
 tc_vec= bccgridvector - ones(length(bccgridvector(:,1)),1)*[x1 y1 z1];  
 num1 = ( (x-x1).^2  + (y- y1 ).^2 +(z- z1).^2  );
 num2 = ( ( tc_vec(:,1).* vec_ray(1)) +( tc_vec(:,2).* vec_ray(2))+( tc_vec(:,3).* vec_ray(3))  ) /norm(vec_ray);
 s = sqrt(num1 - (num2.^2 )  ); 
 aij= cal_ai_blob(m,radius_blob,alpha_blob,s);

end
