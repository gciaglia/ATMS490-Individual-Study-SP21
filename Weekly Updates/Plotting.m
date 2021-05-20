 long = ncread('Aerosolmodul_2010.nc','lon');

latt = ncread('Aerosolmodul_2010.nc','lat');
% 
psd = ncread('Aerosolmodul_2010.nc','PSD');

route = ncread('Aerosolmodul_2010.nc','Route');
% 
% pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1');
% pnc2 = ncread('Aerosolmodul_2010.nc','PNC_2');
% 
% channels =ncread('Aerosolmodul_2010.nc','channel');

% 1. Can't match Fig 6 to raw data, must get the distance and cross reference with the concentrations
% 2. Get time, get the location at the time, get concentration at said time, check for missing and if so omit
% 3. Long x Lat v Time
%
% Particles = mean(part_dist, 2) ; 
% 
% figure(1)
% plot(pnc1) 

figure(2)
plot(psd(:, 1))
plot(psd)
% 
% figure(3)
% plot(pnc2)

%Figure 6 replication####################################### impossible
% 
% [m , idx ] = max(psd, [] , 2) ;
% [n , idy ] = min(psd, [] , 2) ;


% plot(m, 'r', 'LineWidth', 2);
% hold on;
% plot(n, 'b', 'LineWidth', 2);
% shadeplot(length(m), m, n); 
% hold off


%Countour plot ############################################
validLatIdx = latt >= -90;
validLongIdx = long >= -90;
validPsdIdx = psd(:,1) > -999;
validAllIdx = latt >= -90 & long >= 8 & psd(:,1) > -999;

psdChannelOne = psd(:,1);

psdFilteredChannelOne = psdChannelOne(validAllIdx);
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);

figure(1)
geobubble(lattFiltered, longFiltered, psdFilteredChannelOne);

maxLatt = max(lattFiltered) ; 
minLatt = min(lattFiltered) ; 
maxLong = max(longFiltered) ; 
minLong = min(longFiltered) ; 

% index = find(lattFiltered == 49.0236) ; %does not work
% latt_psd = psdFilteredChannelOne(index) ;  

km_latt = deg2km(lattFiltered) ; 
km_long = deg2km(longFiltered) ; 

maxkm_latt = max(km_latt) ; 
minkm_latt = min(km_latt) ; 
maxkm_long = max(km_long) ; 
minkm_long = min(km_long) ; 

kmcity_latt = deg2km(49.0069) ; %Karlsrune City
kmcity_long = deg2km(8.4037) ; %Karlsrune City
% CityBound = sqrt(kmcity_latt.^2 + kmcity_long.^2);
% distance = sqrt(km_latt.^2 + km_long.^2);
% distance_CityBound = CityBound - distance ; 

% maxCityCentered = max(distance_CityBound) ; 
% minCityCentered = min(distance_CityBound) ; 

latt_cityCenterBound = kmcity_latt - km_latt ; 
long_cityCenterBound = kmcity_long - km_long ; 
maxlatt_cityCenterBound = max(latt_cityCenterBound) ; 
minlatt_cityCenterBound = min(latt_cityCenterBound) ; 
% maxlong_cityCenterBound = max(long_cityCenterBound) ; 
% minlong_cityCenterBound = min(long_cityCenterBound) ; 
%distance = stdist(lattFiltered, longFiltered) ;

figure(2)
scatter(latt_cityCenterBound, psdFilteredChannelOne)
%mesh(lattFiltered, longFiltered, psdFilteredChannelOne);


% for i = 0:length(km_latt)
% kmlattitude(i) = 
% end

