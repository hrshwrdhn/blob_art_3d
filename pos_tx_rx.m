% Generate Source detector positions for conical geometry
clc
clear;
%nang_helix = total no. of angle per helix
nang_helix= 50; 
%nhelix= no. of helix
nhelix =1 ;
ang= repmat(( 0:360/nang_helix:359.99 )',nhelix,1);
% no. of detector in y direction and z direction
ndy=25;
ndz=25;
ndetector= ndy*ndz;% no. of detector per projection*
nray=ndetector*length(ang);
% distance bw centre to source
d_cs = 2;
% source position  (ptx,pty,ptz)
%initial position tx at gamma = 0 is [1.5,0,1.5];
ptx0= d_cs;
pty0=0;
gamma= repelem(ang,ndetector,1);
format short
posz= (linspace(1,-1,length(ang)) )';
ptz= repelem(posz,ndetector,1);
ptx= ptx0* cosd(gamma) + pty0 * sind(gamma);
pty= pty0*cosd(gamma) -  ptx0* sind(gamma);
% detector position (prx pry prz)
% initial position of detectors at gamma = 0
zd= (1 : -2/(ndz-1) : -1)*(sqrt(2));
yd = (1 : -2/(ndy-1) : -1)*(sqrt(2));
[Yd,Zd] = meshgrid(yd,zd);
ydet= Yd(:);
zdet= Zd(:);
xdet= -2 * ones(ndetector,1);

xdet1= repmat(xdet,length(ang),1);
ydet1= repmat(ydet,length(ang),1);
zdet1= repmat(zdet,length(ang),1);

prx= xdet1.* cosd(gamma) + ydet1.*sind(gamma) ;
pry=  -1*xdet1.* sind(gamma) + ydet1.*(cosd(gamma));
prz= zdet1;
txpos = [ptx(:),pty(:),ptz(:)];
rxpos = [prx(:),pry(:),prz(:)];
save 'workspace/pos_tx_rx_gamma.mat' txpos rxpos gamma ang
