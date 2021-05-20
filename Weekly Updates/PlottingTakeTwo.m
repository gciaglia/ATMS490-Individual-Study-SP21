long = ncread('Aerosolmodul_2010.nc','lon');

latt = ncread('Aerosolmodul_2010.nc','lat');

route = ncread('Aerosolmodul_2010.nc','Route');

pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1');

time  = ncread('Aerosolmodul_2010.nc','time');

%pnc2 = ncread('Aerosolmodul_2010.nc','PNC_2');
%psd = ncread('Aerosolmodul_2010.nc','PSD');
%channels =ncread('Aerosolmodul_2010.nc','channel');

validRouteTwo = route ==  2 & pnc1 > -999;
routeFiltered = route(validRouteTwo) ;
pnc1Filtered = pnc1(validRouteTwo) ;
timeFiltered = time(validRouteTwo) ; 

figure(1) 
plot(timeFiltered , pnc1Filtered) 
title('Time versus PNC1 on Route 2')
xlabel('Time (s)')
ylabel('particle number concentrations between 10 nm and 3 mu')

validAllIdx = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2;

pnc1FilteredFig2 = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);

figure(2)
geobubble(lattFiltered, longFiltered,pnc1FilteredFig2 );


%psd = ncread('Aerosolmodul_2010.nc','PSD');
% validAll = latt >= -90 & long >= 8 & psd > -999 & route == 2;
% psdFiltered = psd(validAll);
% lattFiltered = latt(validAll);
% longFiltered = long(validAll);
 
lattFilteredF3 = double(lattFiltered) ;
longFilteredF3 = double(longFiltered) ;
pnc1FilteredFig3 =  double(pnc1FilteredFig2) ;

[LatGrid, LonGrid] = meshgrid(linspace(min(lattFiltered), max(lattFiltered)), ...
                        linspace(min(longFiltered), max(longFiltered)));
%[LatGrid, LonGrid] = meshgrid(unique(lattFiltered),unique(longFiltered));
LatGrid = double(LatGrid) ; 
LonGrid = double(LonGrid) ; 
Pnc1Grid = scatteredInterpolant(lattFilteredF3, longFilteredF3, pnc1FilteredFig3) ;
interpolated_data = Pnc1Grid(LatGrid, LonGrid) ;

% validAllFig3 = latt >= -90 & long >= 8 & pnc1 > 0 &route == 2;
% pnc1FilteredFig3 = double(pnc1(validAllFig3)) ;
% lattFilteredFig3 = double(latt(validAllFig3));
% longFilteredFig3 = double(long(validAllFig3));
% Pnc1R2Grid = griddata(lattFilteredFig3, longFilteredFig3, pnc1FilteredFig3, LatGrid, LonGrid);

% Z = pnc1FilteredFig2; % put your Z vector here
% ZZ = zeros(length(Z), length(Z));
% for i = 1:length(Z)
%     ZZ(:,i) = Z(:);
% end
figure(3) 
contour(LatGrid , LonGrid, interpolated_data ) 

% lattUniq = unique(lattFiltered) ; 
% longUniq = unique(longFiltered) ;  
% [LatGrid4, LonGrid4] = meshgrid(lattUniq, longUniq) ; %Takes way too long
% to run

figure(4)  %interpolating wrong
contourf(LonGrid , LatGrid, interpolated_data ) 
colorbar
