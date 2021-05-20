%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 1
%This is a figure that represents all the measurements taken, their
%measured size (as shown by the bubble), and their location geographically
%given by their respective Longitude and Lattitude

clear all
%Import all required data from NC file Aerosolmodul_2010.nc
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
%time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
%nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

%Create arrays that only have data that is useable, get rid of all the
%missing data and locate locations in all the data where all three
%requirements are true
validAllIdx = latt >= -90 & long >= 8 & pnc1 > -999 & tramvel > -999 & route > 0 ;

%applying the conditional statement to the variables
pnc1Filtered = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);

%create the figure, look at Mathworks MATLAB 'geobubble' function for more
%information
figure(1)
geobubble(lattFiltered, longFiltered,pnc1Filtered );
title('All Measured Concentrations Geographically')