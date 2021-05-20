% Plotting Several Runs for the Same Route, From WK 7 CODE
clear all

%Inmport all required data from NC file
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
% plot(timeFilteredR2, pnc1FilteredR2) 
% hold on
plot(timeFilteredR472, pnc1FilteredR472) 
hold on
plot(timeFilteredR473, pnc1FilteredR473)
plot(timeFilteredR478, pnc1FilteredR478)
plot(timeFilteredR479, pnc1FilteredR479)
hold off
legend('Run 472', 'Run 473' , 'Run 478', 'Run 479')

figure(2) %overlap 
% plot(timeFilteredR2, pnc1FilteredR2) 
% hold on
plot(timeFilteredR472 - 5820874, pnc1FilteredR472) 
hold on
plot(timeFilteredR473 -5822613, pnc1FilteredR473)
plot(timeFilteredR478 - 5852984, pnc1FilteredR478)
plot(timeFilteredR479 - 5858758, pnc1FilteredR479)
hold off
legend('Run 472', 'Run 473' , 'Run 478', 'Run 479') %wayyyy busy

%Now trying to get averages for every 40 seconds with 1600 values

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

a = 1 ; 
z = 126 ; %length(latt472) ; 
for k = (1:z) 
    Latt(a) = lattMeans473(k) ;
    Long(a) = longMeans473(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist473(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist473(a) = deg2km(dist473(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist473(a) = dist473(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end


%478
column478 = pnc1FilteredR478 ;
out = reshape(column478(1:5160), [], 40);
means478 = mean(out, 2);
timeforMeans478 = timeFilteredR478(40:40:end) ;
lattMeans478 = lattFilteredR478(40:40:end) ; 
longMeans478 = longFilteredR478(40:40:end) ; 

a = 1 ; 
z = 126 ; %length(latt472) ; 
for k = (1:z) 
    Latt(a) = lattMeans478(k) ;
    Long(a) = longMeans478(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist478(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist478(a) = deg2km(dist478(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist478(a) = dist478(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

%479
column479 = pnc1FilteredR479 ;
out = reshape(column478(1:5040), [], 40);
means479 = mean(out, 2);
timeforMeans479 = timeFilteredR479(40:40:end) ;
lattMeans479 = lattFilteredR479(40:40:end) ; 
longMeans479 = longFilteredR479(40:40:end) ; 

a = 1 ; 
z = 126 ; %length(latt472) ; 
for k = (1:z) 
    Latt(a) = lattMeans479(k) ;
    Long(a) = longMeans479(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist479(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist479(a) = deg2km(dist479(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist479(a) = dist479(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end


figure(3) 
plot((timeforMeans472 - 5820874) , means472);
hold on
plot(timeforMeans473 -5822613, means473)
plot(timeforMeans478 - 5852984, means478)
plot(timeforMeans479 - 5858758, means479)
hold off
legend('Run 472', 'Run 473' , 'Run 478', 'Run 479')
xlabel('Time (seconds)')
ylabel('PNC1 Concentration')
title('Route 2 for Runs 472,473,478,479 averaged every 40 Runs')

means473_short = means473(1:126);
[sortedDist473, sortIndex] = sort(dist473) ;
sortedPNC1473 = means473_short(sortIndex)  ;

means478_short = means478(1:126);
[sortedDist478, sortIndex] = sort(dist478) ;
sortedPNC1478 = means478_short(sortIndex)  ;

means479_short = means479(1:126);
[sortedDist479, sortIndex] = sort(dist479) ;
sortedPNC1479 = means479_short(sortIndex)  ;

figure(4) 
plot(sortedDist473, sortedPNC1473) 
hold on
plot(sortedDist478, sortedPNC1478) 
plot(sortedDist479, sortedPNC1479) 
hold off


martix_of_all = [sortedPNC1473, sortedPNC1478, sortedPNC1479] ;

Max = max(martix_of_all, [], 2) ; 
Min = min(martix_of_all, [], 2) ;
Average_conc = mean(martix_of_all, 2) ; 

matrix_dist = [sortedDist473', sortedDist478', sortedDist479'] ;
Average_dist = mean(matrix_dist, 2) ; 

figure(5)
% Find area coordinates.
% inBetweenRegionX = [1:length(Max), 1:length(Min):-1:1];
% inBetweenRegionY = [Max, fliplr(Min)];
% % Display the area first so it will be in the background.
% fill(inBetweenRegionX, inBetweenRegionY, 'c');
% hold on;

% hold on
% plot(Average_dist, Min)
% plot(Average_dist, Max)
% x = [Average_dist,Average_dist];        % repeat x values
% yy = [Min,Max];   % vector of upper & lower boundaries
% fill(x,yy,'b')
% hold off
x = Average_dist ; 
p = fill([x;flipud(x)],[Min;flipud(Max)],'red')  ;
p.FaceColor = [1 0.8 0.8];      
p.EdgeColor = 'none';           
hold on
%p.FaceColor = [1 0.8 0.8];    
plot(Average_dist, Average_conc, 'k')
hold off
title('Average Concentration for Route 2 with Variablity' )
xlabel('Distance from City (km)')
ylabel('Concentration (PNC1 - cm3)')





