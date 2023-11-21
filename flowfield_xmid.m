%% 
clear;close all;clc;

%%

datpath = '../cases/';
caselist;
csgroup = {rat8};
ig=1;
actgrp=csgroup{ig};
ic=1;
csname = strcat(datpath,actgrp{ic});

readstat;
readgrid;
fgrid=fopen(strcat(csname,'/continua_grid.dat'));
dim=fscanf(fgrid,'%f %f',2);
fclose(fgrid);
lratio=dim(2);
%% load xmid plane

fxmid=strcat(csname,'/slab_xmid.h5');
finfo=h5info(fxmid);
nd=length(finfo.Groups(1).Datasets);
id=400;
dname=strcat('/q3/',finfo.Groups(1).Datasets(id).Name);
q3=h5read(fxmid,dname);
dname=strcat('/te/',finfo.Groups(1).Datasets(id).Name);
te=h5read(fxmid,dname);
dname=strcat('/sa/',finfo.Groups(1).Datasets(id).Name);
sar=h5read(fxmid,dname);
[XX,YY]=meshgrid(zmr,ymr);
[XC,YC]=meshgrid(zmc,ymc);
sac = interp2(XX,YY,sar,XC,YC);
de=sac-te.*Lam;
%%
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
% frmnm = sprintf('time=%06d',id*20);
% fignm = sprintf('../flowfield_fulltime/ras1e12/dr0p23/T%06d.tiff',id*20);
% annotation(fig,'textbox',...
%     [0.4 0.94 0.3 0.05],...
%     'String',{frmnm}, 'FontSize', 40, ...
%     'FitBoxToText','off','LineStyle','none');
% saveas(fig,fignm);


