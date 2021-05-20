clear all

long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

% routes = unique(route) ;

%Making a Plot of all the Routes Clearly shown for the longitude and
%Lattiude

%Route 1
validAllRt1 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 1 ;

lattRt1 = latt(validAllRt1) ;
longRt1 = long(validAllRt1) ; 
matrix1 = [lattRt1 , longRt1 ] ;
Route1 = sortrows(matrix1, 1, {'ascend'}) ;
route_unique1 = unique(Route1, 'rows') ; 

%Route 3
validAll470 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 ;

lattRt3 = latt(validAll470) ;
time470 = time(validAll470) ;
pnc1470 = pnc1(validAll470) ;
longRt3 = long(validAll470) ; 
matrix3 = [lattRt3 , longRt3 ] ;
Route3 = sortrows(matrix3, 1, {'ascend'}) ;
route_unique3 = unique(Route3, 'rows') ; 

%Route 2
validAllRt2 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 2 ;

lattRt2 = latt(validAllRt2) ;
timeRt2 = time(validAllRt2) ;
pnc1Rt2 = pnc1(validAllRt2) ;
longRt2 = long(validAllRt2) ; 
% [sortedLatt2, sortIndex2] = sort(lattRt2) ;
% sortedLong2 = longRt2(sortIndex2)  ;
matrix2 = [lattRt2 , longRt2 ] ;
Route2 = sortrows(matrix2, 1, {'ascend'}) ;
route_unique2 = unique(Route2, 'rows') ; 

%Route 4
validAllRt4 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 4;

lattRt4 = latt(validAllRt4) ;
longRt4 = long(validAllRt4) ; 
matrix4 = [lattRt4 , longRt4 ] ;
Route4 = sortrows(matrix4, 1, {'ascend'}) ;
route_unique4 = unique(Route4, 'rows') ; 

%Route 5
validAllRt5 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 5;

lattRt5 = latt(validAllRt5) ;
longRt5 = long(validAllRt5) ; 
matrix5 = [lattRt5 , longRt5 ] ;
Route5 = sortrows(matrix5, 1, {'ascend'}) ;
route_unique5 = unique(Route5, 'rows') ; 

%Route 6
validAllRt6 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 6;

lattRt6 = latt(validAllRt6) ;
longRt6 = long(validAllRt6) ; 
matrix6 = [lattRt6 , longRt6 ] ;
Route6 = sortrows(matrix6, 1, {'ascend'}) ;
route_unique6 = unique(Route6, 'rows') ; 

%Route 7
validAllRt7 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 7;

lattRt7 = latt(validAllRt7) ;
longRt7 = long(validAllRt7) ; 
matrix7 = [lattRt7 , longRt7 ] ;
Route7 = sortrows(matrix7, 1, {'ascend'}) ;
route_unique7 = unique(Route7, 'rows') ; 

%Route 8
validAllRt8 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 8;

lattRt8 = latt(validAllRt8) ;
longRt8 = long(validAllRt8) ; 
matrix8 = [lattRt8 , longRt8 ] ;
Route8 = sortrows(matrix8, 1, {'ascend'}) ;
route_unique8 = unique(Route8, 'rows') ; 

%Route 9
validAllRt9 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 9;

lattRt9 = latt(validAllRt9) ;
longRt9 = long(validAllRt9) ; 
matrix9 = [lattRt9 , longRt9 ] ;
Route9 = sortrows(matrix9, 1, {'ascend'}) ;
route_unique9 = unique(Route9, 'rows') ; 

%Route 10
validAllRt10 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 10;

lattRt10 = latt(validAllRt10) ;
longRt10 = long(validAllRt10) ; 
matrix10 = [lattRt10 , longRt10 ] ;
Route10 = sortrows(matrix10, 1, {'ascend'}) ;
route_unique10 = unique(Route10, 'rows') ; 

figure(1)
geoplot(route_unique1(: ,1) , route_unique1(: ,2)) 
hold on
geoplot(route_unique2(: ,1) , route_unique2(: ,2)) 
geoplot(route_unique3(: ,1) , route_unique3(: ,2)) 
geoplot(route_unique4(: ,1) , route_unique4(: ,2)) 
geoplot(route_unique5(: ,1) , route_unique5(: ,2)) 
geoplot(route_unique6(: ,1) , route_unique6(: ,2)) 
geoplot(route_unique7(: ,1) , route_unique7(: ,2)) 
geoplot(route_unique8(: ,1) , route_unique8(: ,2)) 
geoplot(route_unique9(: ,1) , route_unique9(: ,2)) 
geoplot(route_unique10(: ,1) , route_unique10(: ,2)) 
hold off

legend('Route 1', ' Route 2', ' Route 3', ' Route 4', ' Route 5', ' Route 6', ' Route 7' ...
    , ' Route 8', ' Route 9', ' Route 10')



%all data same color --- BROKEN
% validAll = latt >= -90 & long >= 4 & pnc1 > -999 &route > 0 ;
% 
% lattitude = latt(validAll) ;
% longitude = long(validAll) ; 
% matrix = [lattitude , longitude ] ;
% Route_all = sortrows(matrix, 1, {'ascend'}) ;
% route_unique_all = unique(Route_all, 'rows') ; 
% 
% figure(2)
% geoplot(route_unique_all(: ,1) , route_unique_all(: ,2)) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wk Six Plot Code
validAllIdx2 = latt >= -90 & long >= 8 & pnc1 > -999 & tramvel > -999 & route > 0 ;

pnc1FilteredFig5 = pnc1(validAllIdx2) ;
lattFilteredFig5 = latt(validAllIdx2);
longFilteredFig5 = long(validAllIdx2);
longFilteredFig5 = long(validAllIdx2);
tramvelFig5 = tramvel(validAllIdx2) ; 

latt_1runFig5 = lattFilteredFig5 ; %(1:61) ;
long_1runFig5 = longFilteredFig5 ; %(1:61) ;
pnc1_1runFig5 = pnc1FilteredFig5; %(1:61);
velT_1runFig5 = tramvelFig5; %(1:61);

% table_1Min= table(latt_1runFig5,long_1runFig5, pnc1_1runFig5,velT_1runFig5,... 
%     'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% % table_1Min.PNC1 = categorical(table_1Min.PNC1);

figure(3)
% gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','TramVel');
% gb.SourceTable.ParticleConc = discretize(table_1Min.PNC1,[0 5000 14000 16000 20000 30000 42000],...
%     'categorical', {'0 - 5000 cm3', '5000 - 14000 cm3', '14000 - 16000 cm3', ...
%     '16000 - 20000 cm3','20000 - 30000 cm3','30000 - 42000 cm3'});
% gb.ColorVariable = 'ParticleConc';
% 
% neworder = {'30000 - 42000 cm3','20000 - 30000 cm3','16000 - 20000 cm3',...
%     '14000 - 16000 cm3','5000 - 14000 cm3','0 - 5000 cm3'};
% gb.SourceTable.ParticleConc = reordercats(gb.SourceTable.ParticleConc,neworder);
% gb.BubbleColorList = autumn(7);
% title('Route 2 for 1 Minute Run')
% gb.SizeLegendTitle = 'Tram Velocity (m/s)';
% gb.ColorLegendTitle = 'Particle Concentation';

geobubble(lattFilteredFig5, longFilteredFig5 , pnc1FilteredFig5)
SizeLegendTitle = 'Particle Concentration (PNC1)';
title('All Routes and Concentrations')


