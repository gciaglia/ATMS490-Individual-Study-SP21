%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 6
%This figure is a geobubble of the runs 472 and 473 in route 2 where every
%40 data points are averaged and plotted using matlabs 'geobubble'
%fucntion.

%Import all required data from NC file
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]


%run 472
validAllIdxR472 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun == 472;
pnc1FilteredR472 = pnc1(validAllIdxR472) ;
lattFilteredR472 = latt(validAllIdxR472);
longFilteredR472 = long(validAllIdxR472);
runFilteredR472 = nrun(validAllIdxR472) ; 
timeFilteredR472 = time(validAllIdxR472) ;

%run 473
validAllIdxR473 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun == 473;
pnc1FilteredR473 = pnc1(validAllIdxR473) ;
lattFilteredR473 = latt(validAllIdxR473);
longFilteredR473 = long(validAllIdxR473);
runFilteredR473 = nrun(validAllIdxR473) ; 
timeFilteredR473 = time(validAllIdxR473) ;

%472 averaged over 40 runs
column472 = pnc1FilteredR472 ;
out = reshape(column472(1:1600), [], 40);
means472 = mean(out, 2);
timeforMeans472 = timeFilteredR472(40:40:end) ;
lattMeans472 = lattFilteredR472(40:40:end) ; 
longMeans472 = longFilteredR472(40:40:end) ; 
run472 = runFilteredR472(40:40:end) ; 

%473 averaged over 40 runs
column473 = pnc1FilteredR473 ;
out = reshape(column473(1:5360), [], 40);
means473 = mean(out, 2);
timeforMeans473 = timeFilteredR473(40:40:end) ;
lattMeans473 = lattFilteredR473(40:40:end) ; 
longMeans473 = longFilteredR473(40:40:end) ; 
run473 = runFilteredR473(40:40:end) ; 

lattCombo = [lattMeans472 ; lattMeans473] ;
longCombo = [longMeans472 ; longMeans473] ;
meansCombo = [means472 ; means473] ;
runCombo = [run472 ; run473] ;

table_1Min= table(lattCombo,longCombo, meansCombo,runCombo,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','Run'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Runs = discretize(table_1Min.Run,[0 473 474],...
    'categorical', {'Run 472', 'Run 473'});
gb.ColorVariable = 'Runs';
title('Route 2 for Run 472, 473 Averaged over Every 40 Runs')