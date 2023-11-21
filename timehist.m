clear;close all;clc;

%%
datpath = '../cases/';
outpath = '../results/';
caselist;
csgroup = {rat8};
ig=1;%1:length(csgroup);
actgrp=csgroup{ig};
ic=7;%1:length(actgrp);
csname = strcat(datpath,actgrp{ic});

readstat;

%% fluxes and velocity


tmp=load(strcat(csname,'/nusse_balance.out'));
nut_dsp=tmp(:,2);
nus_dsp=tmp(:,3);
time=tmp(:,1);

tmp=load(strcat(csname,'/nusse_volume.out'));
nut_cnv=tmp(:,2)+1.0;
nus_cnv=tmp(:,3)+1.0;
fr_cnv=tmp(:,2)./tmp(:,3).*kpt./kps.*Lam;

tmp=load(strcat(csname,'/nusse_walls.out'));
nut_bot=tmp(:,2);
nut_top=tmp(:,3);
nus_bot=tmp(:,4);
nus_top=tmp(:,5);

tmp=load(strcat(csname,'/rms_vel.out'));
Rex_tm=tmp(:,2);
Rey_tm=tmp(:,3);
Rez_tm=tmp(:,4);
Rea_tm=tmp(:,5);
Reh_tm=tmp(:,6);

nusa = [mean(nus_dsp),mean(nus_cnv),mean(nus_bot),mean(nus_top)];
nuta = [mean(nut_dsp),mean(nut_cnv),mean(nut_bot),mean(nut_top)];

ErNus = max(nusa)-min(nusa);
ErNut = max(nuta)-min(nuta);

Nus=mean(nusa);
Nut=mean(nuta);
Rea=mean(Rea_tm);
Rey=mean(Rey_tm);
Rez=mean(Rez_tm);

% figure(1)
% plot(time,nus_cnv)
% figure(2)
% plot(time,nut_cnv)
% figure(3)
% plot(time,nus_top)
% figure(4)
% plot(time,nut_top)
% figure(5)
% plot(time,Rea_tm)
% %xlim([0 1000])
% hold on
% figure(6)
% plot(time,Rez_tm)
% figure(7)
% plot(time,fr_cnv)

%% draw
colorlist
fig=figure('Position',[100 100 1500 700]);
ax1=axes('Position',[0.08,0.55,0.4,0.36]);
plot(time,nut_cnv,'lineWidth',2);
xlabel('$t$','FontName'   , 'AvantGarde', 'Interpreter','latex')
ylabel('$Nu_t$','FontName'   , 'AvantGarde', 'Interpreter','latex')
set(ax1,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on')
%xlim([0 1000])
ax2=axes('Position',[0.56,0.55,0.4,0.36]);
plot(time,nus_cnv,'lineWidth',2);
xlabel('$t$','FontName'   , 'AvantGarde', 'Interpreter','latex')
ylabel('$Nu_s$','FontName'   , 'AvantGarde', 'Interpreter','latex')
set(ax2,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on')
%xlim([0 tm])
ax3=axes('Position',[0.08,0.09,0.4,0.36]);
plot(time,Rey_tm,'lineWidth',2);
xlabel('$t$','FontName'   , 'AvantGarde', 'Interpreter','latex')
ylabel('$Re_y$','FontName'   , 'AvantGarde', 'Interpreter','latex')
set(ax3,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on')
ax4=axes('Position',[0.56,0.09,0.4,0.36]);
plot(time,Rez_tm,'lineWidth',2);
xlabel('$t$','FontName'   , 'AvantGarde', 'Interpreter','latex')
ylabel('$Re_z$','FontName'   , 'AvantGarde', 'Interpreter','latex')
set(ax4,'lineWidth',2,'Fontsize',17,'XminorTick','on', ...
    'FontName','Helvetica', ...
    'Box','on')
