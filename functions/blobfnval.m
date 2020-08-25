function wd = blobfnval(m,a_blob,alpha_blob,d)
% blob is fn of distance from point to centre
% blob(m,a_blob,alpha_blob,d)
% a_blob= radius of blob
% alpha_blob = second parameter
% d = distance of point vector
  
  wd = (sqrt(1- (d/a_blob).^2) ).^m .* besseli(m, alpha_blob* sqrt(1- (d/a_blob).^2))./ besseli(m,alpha_blob);




end
