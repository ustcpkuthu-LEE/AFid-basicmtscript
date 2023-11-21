%% 
clear;close all;clc;
%%
datpath = '../cases/';
%datpath = '../cases/';
caselist;
csgroup = {rat8};
ig=1;
actgrp=csgroup{ig};
ic=10;
csname = strcat(datpath,actgrp{ic});

readstat;
readgrid;

%%
dspuc=h5read(fstats,'/dspuc_mean');
dspuc=dspuc/time;
dspur=h5read(fstats,'/dspur_mean');
dspur=dspur/time;
etau = pi * (vis^3./dspuc).^(0.25);
etas = pi * (vis*kps^2./dspur).^(0.25);
etat = pi * (vis*kpt^2./dspuc).^(0.25);
%%
fig=figure('Position',[200 200 2000 400]);
ax1=axes(fig,'Position',[0.08 0.2 0.25 0.7]);
plot(zmr,etas./dyr,'+-','lineWidth',2)
hold on
plot(zmr(1:end-1),etas(1:end-1)./dzr,'+-','lineWidth',2)
xlabel('$z$','FontName'   , 'AvantGarde', 'Interpreter','latex')
title('$salinity$','FontName'   , 'AvantGarde', 'Interpreter','latex')
legend('dy','dz')
set(ax1,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on','Yscale','log')

ax2=axes(fig,'Position',[0.38 0.2 0.25 0.7]);
plot(zmc,etat./dyc,'+-','lineWidth',2)
hold on
plot(zmc(1:end-1),etat(1:end-1)./dzc,'+-','lineWidth',2)
xlabel('$z$','FontName'   , 'AvantGarde', 'Interpreter','latex')
title('$temperature$','FontName'   , 'AvantGarde', 'Interpreter','latex')
legend('dy','dz')
set(ax2,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on','Yscale','log')

ax3=axes(fig,'Position',[0.68 0.2 0.25 0.7]);
plot(zmc,etau./dyc,'+-','lineWidth',2)
hold on
plot(zmc(1:end-1),etau(1:end-1)./dzc,'+-','lineWidth',2)
xlabel('$z$','FontName'   , 'AvantGarde', 'Interpreter','latex')
title('$momentum$','FontName'   , 'AvantGarde', 'Interpreter','latex')
legend('dy','dz')
set(ax3,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on','Yscale','log')