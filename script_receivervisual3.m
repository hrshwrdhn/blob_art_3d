%visualize transmitter receiver array positions 
load 'workspace/pos_tx_rx_gamma.mat'
ind=find(abs(gamma -  0) <= .2);
ptx= txpos(:,1);
pty=txpos(:,2);
ptz=txpos(:,3);
prx= rxpos(:,1);
pry=rxpos(:,2);
prz=rxpos(:,3);
indrx=prx(ind);
indry=pry(ind);
indtx=ptx(ind);
indty=pty(ind);
%scatter3(ydet1(ind),xdet1(ind),zdet1(ind))
close all;
figure(1);
scatter3(ptx(ind),pty(ind),ptz(ind))
hold on
scatter3(prx(ind),pry(ind),prz(ind))
hold on
ccor= [-1 -1 -1; -1 -1 1; -1 1 -1; -1 1 1;1 1 1; 1 -1 1 ; 1 -1 -1; 1 1 -1 ];
scatter3(ccor(:,1), ccor(:,2), ccor(:,3))
xlabel('x')
ylabel('y')
zlabel('z')
