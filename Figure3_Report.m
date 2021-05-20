%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 3
%This is a figure that represents measurements taken for Route 2 and run 472 specifically,
%their measured size (as shown by the bubble), and their location
%geographically given by their respective Longitude and Lattitude, the same
%data either creates points averaged every 20 or 40 data points

%Import all required data from NC file Aerosolmodul_2010.nc
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
%time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
%tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

%Create arrays that only have data that is useable, get rid of all the
%missing data and locate locations in all the data where all five
%requirements are true
validAllIdx = latt >= -90 & long >= 8 & pnc1 > -999 & route ==2 & nrun==472;

pnc1Filtered = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);

latt_1run = lattFiltered;
long_1run = longFiltered;
pnc1_1run = pnc1Filtered;


figure(1)
geobubble(latt_1run, long_1run, pnc1_1run );
title('Route 2 for Run 472 Mapping')

% %Now trying to get averages for every 40 seconds with 1600 values

column2 = pnc1_1run ;
out = reshape(column2(1:1600), [], 40);
means40sec = mean(out, 2);
lattMeans = latt_1run(40:40:end) ; 
longMeans = long_1run(40:40:end) ; 

%decreasing spacing to 20 sec intervals %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
column2 = pnc1_1run ;
out = reshape(column2(1:1620), [], 20);
means20sec = mean(out, 2);
lattMeans2 = latt_1run(20:20:end) ; 
longMeans2 = long_1run(20:20:end) ; 

figure(2) 
geobubble(lattMeans2, longMeans2, means20sec );
title('Route 2 for Run 472 Averaged Every 20 Runs')

figure(3) 
geobubble(lattMeans, longMeans, means40sec );
title('Route 2 for Run 472 Averaged Every 40 Runs')





