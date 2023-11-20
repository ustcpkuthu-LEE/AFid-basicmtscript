clear;close all;clc;

%%
datpath = '../cases/';
%datpath = '../cases/';
caselist;
csgroup = {rat8};
ig=1;
actgrp=csgroup{ig};
ic=1;
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
sm=mean(sar);

fcont=strcat(csname,'/continua_dens.h5');
te=h5read(fcont,'/dens');
te=squeeze(te);
tm=mean(te);

readgrid;
[XX,YY]=meshgrid(zmr,ymr);
[XC,YC]=meshgrid(zmc,ymc);
sac = interp2(XX,YY,sar,XC,YC);
de=sac.*Lam-te;
dm=mean(de);
%% draw
fig=figure('Position',[300 300 1000 500]);
ax1=axes(fig,'Position',[0.13 0.15 0.15 0.8]);
plot(sm,zmr,'linewidth',2)
xlabel('$salinty$','FontName'   , 'AvantGarde', 'Interpreter','latex')
ylabel('$z$','FontName'   , 'AvantGarde', 'Interpreter','latex')
set(ax1,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on')

ax2=axes(fig,'Position',[0.43 0.15 0.15 0.8]);
plot(tm,zmc,'linewidth',2)
xlabel('$temperature$','FontName'   , 'AvantGarde', 'Interpreter','latex')
ylabel('$z$','FontName'   , 'AvantGarde', 'Interpreter','latex')
set(ax2,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on')

ax3=axes(fig,'Position',[0.73 0.15 0.15 0.8]);
plot(dm,zmc,'linewidth',2)
xlabel('$density$','FontName'   , 'AvantGarde', 'Interpreter','latex')
ylabel('$z$','FontName'   , 'AvantGarde', 'Interpreter','latex')
set(ax3,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on')

