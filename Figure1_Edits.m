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
routeFiltered = route(validAllIdx);

figure (1)

table_1Min= table(lattFiltered,longFiltered, pnc1Filtered,routeFiltered,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','Route'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Route = discretize(table_1Min.Route,[0 1 2 3 4 5 ],...
    'categorical', {'Route 1', 'Route 2', 'Route 3',...
    'Route 4','Route 5'});
gb.ColorVariable = 'Route';
title('Various Routes in Variable PNC1')

% table_R2a3= table(lattComboR2a3,longComboR2a3, meansComboR2a3,runComboR2a3,... 
%     'VariableNames',{'Lattitude','Longitude','PNC1','Run'}) ;
% % table_R3.PNC1 = categorical(table_R3.PNC1);
% 
% gb = geobubble(table_R2a3, 'Lattitude','Longitude','SizeVariable','PNC1');
% gb.SourceTable.Runs = discretize(table_R2a3.Run,[0 471 472 473 474],...
%     'categorical', {'Run 470', 'Run 471','Run 472', 'Run 473'});
% gb.ColorVariable = 'Runs';
% title('Route 2 and 3 for Runs 470-473 ')
