%using route 2 PNC1 variable and testing to make sure all points are in the
%same direction
 
clear all

%Lat in y and concentration in x
%Inmport all required data from NC file
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

validRouteTwo = route ==  2 & pnc1 > -999;
routeFiltered = route(validRouteTwo) ;
pnc1Filtered = pnc1(validRouteTwo) ;
timeFiltered = time(validRouteTwo) ; 


figure(1) %this figure is the concentration versus time for all data collected
plot(timeFiltered , pnc1Filtered) 
title('Time versus PNC1 on Route 2')
xlabel('Time (s)')
ylabel('particle number concentrations between 10 nm and 3 mu')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% One Run for Rt. 2

validAllIdx = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun == 472;

pnc1FilteredFig2 = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);
runFiltered = nrun(validAllIdx) ; 
timeFilteredFig2 = time(validAllIdx) ;


latt_1run = lattFiltered;
long_1run = longFiltered;
pnc1_1runFig2 = pnc1FilteredFig2;


%Now trying to get averages for every 40 seconds with 1600 values

column2 = pnc1_1runFig2 ;
out = reshape(column2(1:1600), [], 40);
means40sec = mean(out, 2);

timeforMeans = timeFilteredFig2(40:40:end) ;
lattMeans = latt_1run(40:40:end) ; 
longMeans = long_1run(40:40:end) ; 

figure(2)
plot(timeforMeans, means40sec)
title(' Concentration vs. Time ')
ylabel('Concentration')
xlabel('Time')




km_latt = deg2km(lattMeans) ; 
km_long = deg2km(longMeans) ; 

kmcity_latt = deg2km(49.0069) ; %Karlsrune City
kmcity_long = deg2km(8.4037) ; %Karlsrune City

latt_cityCenterBound = kmcity_latt - km_latt ; 
long_cityCenterBound = kmcity_long - km_long ; 

combo = sqrt(latt_cityCenterBound.^2 + long_cityCenterBound.^2) ;

%combo2 = distance(lattMeans(1), longMeans(1)) - distance(49.0069,8.4037) ;

pair = [lattMeans , longMeans] ;

a = 1 ; 

for k = (1:40) 
    Latt(a) = lattMeans(k) ;
    Long(a) = longMeans(k) ;
    
%     Latt2(a) = lattMeans(k+1) ;
%     Long2(a) = longMeans(k+1) ;
    
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    a = a + 1 ;
    
%     for j = k + 1
%         LattLong2 = 
%         distance(j) = distance(LattLong, lattMean , longMean) - distance(49.0069,8.4037) ;
%     
%     end 
    
end


figure(3)
plot(means40sec, lattMeans)
title('Mean Concentration vs. Lattitude')
ylabel('Latitude')
xlabel('Concentration')

figure(4)
plot(lattMeans, means40sec)
title('Lattitude vs. Mean Concentration')
xlabel('Latitude')
ylabel('Concentration')

% figure(5)
% scatter(long_cityCenterBound, means40sec) ;
% title('Longitude vs. Mean Concentration')
% xlabel('Longitude')
% ylabel('Concentration')
% 
% figure(6)
% plot(dist, means40sec);
% xlabel('Distance from Karlsrune City with Avg. Every 40 Time Steps')
% ylabel('Concentration')
% 
% 
% %decreasing spacing to 20 sec intervals
% column2 = pnc1_1runFig2 ;
% out = reshape(column2(1:1620), [], 20);
% means20sec = mean(out, 2);
% 
% timeforMeans2 = timeFilteredFig2(20:20:end) ;
% lattMeans2 = latt_1run(20:20:end) ; 
% longMeans2 = long_1run(20:20:end) ; 
% 
% a = 1 ; 
% 
% for k = (1:81) 
%     Latt2(a) = lattMeans2(k) ;
%     Long2(a) = longMeans2(k) ;
%     
%     %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%     dist2(a) = distance(49.0069 , 8.4037 , Latt2(a), Long2(a) ) ; %origin, destination
%     a = a + 1 ;
%    
% end
% 
% figure(7)
% plot(dist2, means20sec);
% xlabel('Distance from Karlsrune City with Avg. Every 20 Time Steps')
% ylabel('Concentration')
% 
% 
% %increasing average spacing to 60 seconds
% column2 = pnc1_1runFig2 ;
% out = reshape(column2(1:1620), [], 60);
% means60sec = mean(out, 2);
% 
% timeforMeans2 = timeFilteredFig2(20:20:end) ;
% lattMeans3 = latt_1run(60:60:end) ; 
% longMeans3 = long_1run(60:60:end) ; 
% 
% 
% a = 1 ; 
% 
% for k = (1:27) 
%     Latt2(a) = lattMeans3(k) ;
%     Long2(a) = longMeans3(k) ;
%     
%     %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%     dist3(a) = distance(49.0069 , 8.4037 , Latt2(a), Long2(a) ) ; %origin, destination
%     a = a + 1 ;
%    
% end
% 
% figure(8)
% plot(dist3, means60sec);
% xlabel('Distance from Karlsrune City with Avg. Every 60 Time Steps')
% ylabel('Concentration')
% 
% 
% %all data for 
% 
% latt_1run = lattFiltered;
% long_1run = longFiltered;
% pnc1_1runFig2 = pnc1FilteredFig2;
% column2 = pnc1_1runFig2 ;
% 
% 
% a = 1 ; 
% 
% for k = (1:1636) 
%     Latt2(a) = latt_1run(k) ;
%     Long2(a) = long_1run(k) ;
%     
%     %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%     dist4(a) = distance(49.0069 , 8.4037 , Latt2(a), Long2(a) ) ; %origin, destination
%     a = a + 1 ;
%    
% end
% 
% figure(9)
% plot(dist4, column2);
% xlabel('Distance from Karlsrune City with All Data Points')
% ylabel('Concentration')
% 
% 
% %-------------------------------------------------------------------------
% 
% %increasing average spacing to 60 seconds
% column2 = pnc1_1runFig2 ;
% out = reshape(column2(1:1630), [], 10);
% means60sec = mean(out, 2);
% 
% lattMeans3 = latt_1run(10:10:end) ; 
% longMeans3 = long_1run(10:10:end) ; 
% 
% 
% a = 1 ; 
% 
% for k = (1:163) 
%     Latt2(a) = lattMeans3(k) ;
%     Long2(a) = longMeans3(k) ;
%     
%     %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%     dist3(a) = distance(49.0069 , 8.4037 , Latt2(a), Long2(a) ) ; %origin, destination
%     a = a + 1 ;
%    
% end
% 
% figure(10)
% plot(dist3, means60sec);
% xlabel('Distance from Karlsrune City with Avg. Every 60 Time Steps')
% ylabel('Concentration')


%%
validAllIdx = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 ;

pnc1FilteredFig = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);
runFiltered = nrun(validAllIdx) ; 
timeFilteredFig = time(validAllIdx) ;

column2 = pnc1FilteredFig ;
out = reshape(column2(1:412000), [], 1000);
means50sec = mean(out, 2);

lattMeans3 = lattFiltered(1000:1000:end) ; 
longMeans3 = longFiltered(1000:1000:end) ; 


a = 1 ; 

for k = (1:412) 
    Latt2(a) = lattMeans3(k) ;
    Long2(a) = longMeans3(k) ;
    
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist3(a) = distance(49.0069 , 8.4037 , Latt2(a), Long2(a) ) ; %origin, destination
    a = a + 1 ;
   
end

figure(10)
plot(dist3, means50sec);
xlabel('Distance from Karlsrune City')
ylabel('Concentration')



