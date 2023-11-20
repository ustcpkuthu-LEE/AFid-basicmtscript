%%
fstats=strcat(csname,'/statistics.h5');
Ras=h5read(fstats,'/RaS');
Rat=h5read(fstats,'/RaT');
Prt=h5read(fstats,'/PrT');
Prs=h5read(fstats,'/PrS');
Ri=h5read(fstats,'/Ri');
Lam = Prs.*Rat./Prt./Ras;
Rib=Ri*(Lam-1);
vis = (Prs./Ras).^0.5;%finger
%vis = (Prt./Rat).^0.5;%diffusive
kps = vis./Prs;
kpt = vis./Prt;
Lew=kpt./kps;
time=h5read(fstats,'/time_period');
fprintf(strcat(' Case:',actgrp{ic},'\n'));
fprintf('   RaT=%8.1e,  Ras=%8.1e\n', Rat,Ras);
fprintf('   Lam=%8.1e\n', Lam);