%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 8
%This figure represetnats a short interval of 60 seconds of route 2 where
%the bubbles size represents the concentration size and the color
%represents the velocity

%Inmport all required data from NC file
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

latt_1run = lattFiltered(1:61) ;
long_1run = longFiltered(1:61) ;
pnc1_1run = pnc1Filtered(1:61);
velT_1run = tramvel(1:61);

table_1Min= table(latt_1run,long_1run, pnc1_1run,velT_1run,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Velocity = discretize(table_1Min.TramVel,[0 0.10 0.50 1.5 5 10 13 17],...
    'categorical', {'0 - 0.1 m/s', '0.1 - 0.5 m/s', '0.5 - 1.5 m/s', '1.5 - 5.0 m/s',...
    '5.0 - 10.0 m/s','10.0 - 13.0 m/s','13.0  17.0 m/s'});
gb.ColorVariable = 'Velocity';
title('1 Minute Run in Route 2')


