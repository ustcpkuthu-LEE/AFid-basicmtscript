fgrid=strcat(csname,'/field_grid.h5');

ymr=h5read(fgrid,'/ycr');
ymc=h5read(fgrid,'/ycb');
zmr=h5read(fgrid,'/zcr');
zmc=h5read(fgrid,'/zcb');


nyc=length(ymc);
nyr=length(ymr);
nzc=length(zmc);
nzr=length(zmr);

dyc=ymc(2)-ymc(1);
dyr=ymr(2)-ymr(1);
dzc=zmc(2:end)-zmc(1:end-1);
dzr=zmr(2:end)-zmr(1:end-1);

%3D
% xmr=h5read(fgrid,'/xcr');
% xmc=h5read(fgrid,'/xcb');
% nxc=length(xmc);
% nxr=length(xmr);
% dxc=xmc(2)-xmc(1);
% dxr=xmr(2)-xmr(1);