function [aij, proj_blobgrid]=fun_proj_blobgrid(cn,pt,x1,y1,z1,x2,y2,z2)
 % generate projection through a ray
 n=128;
 del=2/(n-1);
 I=length(cn);
 aij = zeros(1,I);
 poss= [x1 y1 z1]';
 posd = [x2 y2 z2]';
 posv= poss-posd;
 posis= pt' - poss; 
 x= pt(:,1);
 y= pt(:,2);
 z = pt(:,3);
 [a_blob,alpha_blob,m]= blobinputdata(del);
 num1 = ( (x-poss(1)).^2  + (y- poss(2) ).^2 +(z- poss(3)).^2  )';
 num2 = ( ( posis(1,:).* posv(1)) +( posis(2,:).* posv(2))+( posis(3,:).* posv(3))                ) /norm(posv);
 s = sqrt(num1 - (num2.^2 )  ); 
 % inds=find(s<=a_blob);
 aij= zeros(1,length(pt));
 aij= vec_xray_blob(m,a_blob,alpha_blob,s);
 proj_blobgrid = sum(aij.*cn');
end
