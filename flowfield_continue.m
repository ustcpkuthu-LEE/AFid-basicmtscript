clear;close all;clc;

%%
datpath = '../cases/';
%datpath = '../cases/';
caselist;
csgroup = {rat8};
ig=1;
actgrp=csgroup{ig};
ic=7;
csname = strcat(datpath,actgrp{ic});

readstat;

%% continue
fgrid=fopen(strcat(csname,'/continua_grid.dat'));
dim=fscanf(fgrid,'%f %f',2);
fclose(fgrid);
lratio=dim(2);

fcont=strcat(csname,'/continua_dsal.h5');
sar=h5read(fcont,'/dsal');
sar=squeeze(sar);

fcont=strcat(csname,'/continua_dens.h5');
te=h5read(fcont,'/dens');
te=squeeze(te);

fcont=strcat(csname,'/continua_q3.h5');
q3=h5read(fcont,'/q3');
q3=squeeze(q3);

readgrid;
[XX,YY]=meshgrid(zmr,ymr);
[XC,YC]=meshgrid(zmc,ymc);
sac = interp2(XX,YY,sar,XC,YC);
de=sac-te.*Lam;
%% draw
asp = [lratio 1 1];
ph=300;
pw=ph.*lratio;
close;
fig=figure('Position',[100 100 pw ph]);
ax1=axes(fig,'Position',[0.1 0.55 0.35 0.35]);
rmap=1000;
cmap=brewermap(rmap,'*RdBu');
colormap(cmap)
pcolor(ymr,zmr,sar');
%caxis(ax1,[0.4 0.6]);
shading interp;
pbaspect(asp);
set(ax1,'XTick',[],'YTick',[],'lineWidth',2,'Fontsize',17);
title('salinity','FontName'   , 'AvantGarde')
colorbar('eastoutside','FontSize',17)
hold(ax1,'off');

ax2=axes(fig,'Position',[0.55 0.55 0.35 0.35]);
rmap=1000;
cmap=brewermap(rmap,'*RdBu');
colormap(cmap)
pcolor(ymc,zmc,te');
clim(ax2,[0 1]);
shading interp;
pbaspect(asp);
set(ax2,'XTick',[],'YTick',[],'lineWidth',2,'Fontsize',17);
title('temperature','FontName'   , 'AvantGarde')
colorbar('eastoutside','FontSize',17)
hold(ax2,'off');

ax3=axes(fig,'Position',[0.1 0.02 0.35 0.35]);
rmap=1000;
cmap=brewermap(rmap,'*RdBu');
colormap(cmap)
pcolor(ymc,zmc,de');
shading interp;
pbaspect(asp);
set(ax3,'XTick',[],'YTick',[],'lineWidth',2,'Fontsize',17);
title('density','FontName'   , 'AvantGarde')
colorbar('eastoutside','FontSize',17)
hold(ax3,'off');

ax4=axes(fig,'Position',[0.55 0.02 0.35 0.35]);
rmap=1000;
cmap=brewermap(rmap,'*RdBu');
colormap(cmap)
pcolor(ymc,zmc,q3');
shading interp;
pbaspect(asp);
set(ax4,'XTick',[],'YTick',[],'lineWidth',2,'Fontsize',17);
title('w','FontName'   , 'AvantGarde')
colorbar('eastoutside','FontSize',17)
hold(ax4,'off');