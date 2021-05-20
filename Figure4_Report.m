%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 4
%This is a figure that represents concentrations measurements taken for Route 2 and runs
%472, 473, 478, and 479 over time


%Import all required data from NC file
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

validAllIdxRt2 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun > -999;

pnc1FilteredR2 = pnc1(validAllIdxRt2) ;
lattFilteredR2 = latt(validAllIdxRt2);
longFilteredR2 = long(validAllIdxRt2);
runFilteredR2 = nrun(validAllIdxRt2) ; 
timeFilteredR2 = time(validAllIdxRt2) ;

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

%run 478
validAllIdxR478 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun == 478;
pnc1FilteredR478 = pnc1(validAllIdxR478) ;
lattFilteredR478 = latt(validAllIdxR478);
longFilteredR478 = long(validAllIdxR478);
runFilteredR478 = nrun(validAllIdxR478) ; 
timeFilteredR478 = time(validAllIdxR478) ;

%run 479
validAllIdxR479 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun == 479;
pnc1FilteredR479 = pnc1(validAllIdxR479) ;
lattFilteredR479 = latt(validAllIdxR479);
longFilteredR479 = long(validAllIdxR479);
runFilteredR479 = nrun(validAllIdxR479) ; 
timeFilteredR479 = time(validAllIdxR479) ;

figure(1) %proves they are all diff run times
plot(timeFilteredR472, pnc1FilteredR472) 
hold on
plot(timeFilteredR473, pnc1FilteredR473)
plot(timeFilteredR478, pnc1FilteredR478)
plot(timeFilteredR479, pnc1FilteredR479)
hold off
xlabel('Time (seconds)')
ylabel('PNC1 Concentration')
title('Route 2 for Runs 472,473,478,479 Concentrations over Time')
legend('Run 472', 'Run 473' , 'Run 478', 'Run 479')

%Now trying to get averages for every 40 seconds %%%%%%%%%%%%%%%%%%%%%%

%472
column472 = pnc1FilteredR472 ;
out = reshape(column472(1:1600), [], 40);
means472 = mean(out, 2);
timeforMeans472 = timeFilteredR472(40:40:end) ;
lattMeans472 = lattFilteredR472(40:40:end) ; 
longMeans472 = longFilteredR472(40:40:end) ; 

%473
column473 = pnc1FilteredR473 ;
out = reshape(column473(1:5360), [], 40);
means473 = mean(out, 2);
timeforMeans473 = timeFilteredR473(40:40:end) ;
lattMeans473 = lattFilteredR473(40:40:end) ; 
longMeans473 = longFilteredR473(40:40:end) ; 

%478
column478 = pnc1FilteredR478 ;
out = reshape(column478(1:5160), [], 40);
means478 = mean(out, 2);
timeforMeans478 = timeFilteredR478(40:40:end) ;
lattMeans478 = lattFilteredR478(40:40:end) ; 
longMeans478 = longFilteredR478(40:40:end) ; 

%479
column479 = pnc1FilteredR479 ;
out = reshape(column478(1:5040), [], 40);
means479 = mean(out, 2);
timeforMeans479 = timeFilteredR479(40:40:end) ;
lattMeans479 = lattFilteredR479(40:40:end) ; 
longMeans479 = longFilteredR479(40:40:end) ; 

figure(2) %Concentrations Aligned in Time
plot((timeforMeans472 - 5820874) , means472);
hold on
plot(timeforMeans473 -5822613, means473)
plot(timeforMeans478 - 5852984, means478)
plot(timeforMeans479 - 5858758, means479)
hold off
legend('Run 472', 'Run 473' , 'Run 478', 'Run 479')
xlabel('Time (seconds)')
ylabel('PNC1 Concentration')
title('Route 2 for Runs 472,473,478,479 Averaged Every 40 Runs')