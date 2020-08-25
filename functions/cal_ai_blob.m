function [aij] =cal_ai_blob(m,radius_blob,alpha_blob,s)
%calculate ai matrix using blob parameter 
% [aij] =cal_ai_blob(m,radius_blob,alpha_blob,s)
% find x-ray tranform of blob basic function 
%  m= order of bessel function,
% radius_blob is radius of support, 
% alpha_blob = parameter controls shape of blobs
% s= distance of center of blob to line (ray)
 aij= zeros(size(s));
 ind = find (s< radius_blob);
 fact1 = sqrt(1-(s/radius_blob).^2);
 Im2 = besseli(m + .5, alpha_blob* fact1);
 aij(ind) = radius_blob* sqrt(2*pi/alpha_blob) * (fact1(ind).^(m+.5) ).* Im2(ind) ./ (8.6500e+04); 
end
