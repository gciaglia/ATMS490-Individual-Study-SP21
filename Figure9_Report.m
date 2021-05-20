%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 9
%This figure represetnats a short interval of 60 seconds of route 2 where
%the bubbles size represents the trams velocity and the color
%represents the particle concentration

%Import all required data from NC file
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

figure(1)
validAllIdx2 = latt >= -90 & long >= 8 & pnc1 > -999 & tramvel > -999 & route == 2;

pnc1Filtered = pnc1(validAllIdx2) ;
lattFiltered = latt(validAllIdx2);
longFiltered = long(validAllIdx2);
tramvel = tramvel(validAllIdx2) ; 

latt_1runF= lattFiltered(1:61) ;
long_1run = longFiltered(1:61) ;
pnc1_1run = pnc1Filtered(1:61);
velT_1run = tramvel(1:61);

table_1Min= table(latt_1run,long_1run, pnc1_1run,velT_1run,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','TramVel');
gb.SourceTable.ParticleConc = discretize(table_1Min.PNC1,[0 5000 14000 16000 20000 30000 42000],...
    'categorical', {'0 - 5000 cm3', '5000 - 14000 cm3', '14000 - 16000 cm3', ...
    '16000 - 20000 cm3','20000 - 30000 cm3','30000 - 42000 cm3'});
gb.ColorVariable = 'ParticleConc';

neworder = {'30000 - 42000 cm3','20000 - 30000 cm3','16000 - 20000 cm3',...
    '14000 - 16000 cm3','5000 - 14000 cm3','0 - 5000 cm3'};
gb.SourceTable.ParticleConc = reordercats(gb.SourceTable.ParticleConc,neworder);
gb.BubbleColorList = autumn(7);
title('1 Minute Run for Route 2')
gb.SizeLegendTitle = 'Tram Velocity (m/s)';
gb.ColorLegendTitle = 'Particle Concentation';