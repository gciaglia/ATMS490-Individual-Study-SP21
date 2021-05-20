%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 7
%This figure is a geobubble of the runs 470-473 in route 2 where every
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

%run 470
validAllIdxR470 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 3 & nrun == 470;
pnc1FilteredR470 = pnc1(validAllIdxR470) ;
lattFilteredR470 = latt(validAllIdxR470);
longFilteredR470 = long(validAllIdxR470);
runFilteredR470 = nrun(validAllIdxR470) ; 
timeFilteredR470 = time(validAllIdxR470) ;

%run 471
validAllIdxR471 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 3 & nrun == 471;
pnc1FilteredR471 = pnc1(validAllIdxR471) ;
lattFilteredR471 = latt(validAllIdxR471);
longFilteredR471 = long(validAllIdxR471);
runFilteredR471 = nrun(validAllIdxR471) ; 
timeFilteredR471 = time(validAllIdxR471) ;

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


%470 Averaged every 40 data points
column470 = pnc1FilteredR470 ;
out = reshape(column470(1:3960), [], 40);
means470 = mean(out, 2);
timeforMeans470 = timeFilteredR470(40:40:end) ;
lattMeans470 = lattFilteredR470(40:40:end) ; 
longMeans470 = longFilteredR470(40:40:end) ; 
run470 = runFilteredR470(40:40:end) ; 

%471 Averaged every 40 data points
column471 = pnc1FilteredR471 ;
out = reshape(column471(1:4040), [], 40);
means471 = mean(out, 2);
timeforMeans471 = timeFilteredR471(40:40:end) ;
lattMeans471 = lattFilteredR471(40:40:end) ; 
longMeans471 = longFilteredR471(40:40:end) ; 
run471 = runFilteredR471(40:40:end) ; 

%472 Averaged every 40 data points
column472 = pnc1FilteredR472 ;
out = reshape(column472(1:1600), [], 40);
means472 = mean(out, 2);
timeforMeans472 = timeFilteredR472(40:40:end) ;
lattMeans472 = lattFilteredR472(40:40:end) ; 
longMeans472 = longFilteredR472(40:40:end) ; 
run472 = runFilteredR472(40:40:end) ; 

%473 Averaged every 40 data points
column473 = pnc1FilteredR473 ;
out = reshape(column473(1:5360), [], 40);
means473 = mean(out, 2);
timeforMeans473 = timeFilteredR473(40:40:end) ;
lattMeans473 = lattFilteredR473(40:40:end) ; 
longMeans473 = longFilteredR473(40:40:end) ; 
run473 = runFilteredR473(40:40:end) ; 

figure(1) %combining route 2 and 3 470-473

lattComboR2a3 = [lattMeans470 ; lattMeans471 ; lattMeans472 ; lattMeans473] ;
longComboR2a3 = [longMeans470 ; longMeans471 ; longMeans472 ; longMeans473] ;
meansComboR2a3 = [means470 ; means471; means472 ; means473] ;
runComboR2a3 = [run470 ; run471 ; run472 ; run473] ;
table_R2a3= table(lattComboR2a3,longComboR2a3, meansComboR2a3,runComboR2a3,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','Run'}) ;
% table_R3.PNC1 = categorical(table_R3.PNC1);

gb = geobubble(table_R2a3, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Runs = discretize(table_R2a3.Run,[0 471 472 473 474],...
    'categorical', {'Run 470', 'Run 471','Run 472', 'Run 473'});
gb.ColorVariable = 'Runs';
title('Route 2 and Route 3 for Runs 470-473 ')