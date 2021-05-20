%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 5
%This figure represetns the direction of the measurements for runs 472,
%473, 478, 479, 480, and 481 in route 2 by comparing the lattitude over
%time 

%Import all required data from NC file
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

%Create arrays that only have data that is useable, get rid of all the
%missing data and locate locations in all the data where all
%requirements are true
validAll472 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 472 ;
validAll473 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 473 ;
validAll478 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 478 ;
validAll479 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 479 ;
validAll480 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 480 ;
validAll481 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 481 ;

run472 = latt(validAll472) ;
time472 = time(validAll472) ;
run473 = latt(validAll473) ;
time473 = time(validAll473) ;
run478 = latt(validAll478) ;
time478 = time(validAll478) ;
run479 = latt(validAll479) ;
time479 = time(validAll479) ;
run480 = latt(validAll480) ;
time480 = time(validAll480) ;
run481 = latt(validAll481) ;
time481 = time(validAll481) ;


figure(1)
plot(time472, run472 ,'y')
hold on
plot(time473, run473, 'c') 
plot(time478, run478 , 'r') 
plot(time479, run479 ,'g')
plot(time480, run480 , 'b')
plot(time481, run481, 'm') 
hold off
legend('472', '473','478','479','480','481')
xlabel('Time (seconds)')
ylabel('Lattitude (deg)')
title('Route 2 Lattitude verus Time for Several Runs')