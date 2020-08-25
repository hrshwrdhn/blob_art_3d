function [p]=f3_imgvalgrid(gridvector)
% p = f3_imgvalgrid(X_vector)
% position vector has size N*3 :
%col1: x coordinate col2= y cord co3 = z cord
% generate value from the 3-D shepp logan phantom
% ref: A.C. Kak , computerized tomography
%         A      a     b     c     x0      y0      z0    phi  theta    psi
 e=  slphantom3_data();
 [sizexe,sizeye]=size(e);
 x= gridvector(:,1);
 y= gridvector(:,2);
 z=gridvector(:,3);
 p=zeros(size(x));
 coord = [flatten(x); flatten(y); flatten(z)];
 p = (flatten(p))';

  for k = 1:sizexe
    A = e(k,1);            % Amplitude change for this ellipsoid
    asq = e(k,2)^2;        % a^2
    bsq = e(k,3)^2;        % b^2
    csq = e(k,4)^2;        % c^2
    x0 = e(k,5);           % x offset
    y0 = e(k,6);           % y offset
    z0 = e(k,7);           % z offset
    phi = e(k,8)*pi/180;   % first Euler angle in radians
    theta = e(k,9)*pi/180; % second Euler angle in radians
    psi = e(k,10)*pi/180;  % third Euler angle in radians
    cphi = cos(phi);
    sphi = sin(phi);
    ctheta = cos(theta);
    stheta = sin(theta);
    cpsi = cos(psi);
    spsi = sin(psi);
    % Euler rotation matrix
    alpha = [cpsi*cphi-ctheta*sphi*spsi   cpsi*sphi+ctheta*cphi*spsi  spsi*stheta;
            -spsi*cphi-ctheta*sphi*cpsi  -spsi*sphi+ctheta*cphi*cpsi cpsi*stheta;
            stheta*sphi                  -stheta*cphi                ctheta];        
    % rotated ellipsoid coordinates
    coordp = alpha*coord;
    idx = find((coordp(1,:)-x0).^2./asq + (coordp(2,:)-y0).^2./bsq + (coordp(3,:)-z0).^2./csq <= 1);
    p(idx) = p(idx) + A;
  end
end

