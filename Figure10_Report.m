%Gianna Ciaglia
%ATMS 490: Individual Study Spring 2021

%Document Figure 10
%This figure represetnats the variation of runs 473, 478, and 479 in route 2
%concetrations with respect to the distances from the city

clear all

%Import all required data from NC file
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]


validAll473 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 473 ;
validAll478 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 478 ;
validAll479 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 479 ;

run473 = latt(validAll473) ;
pnc1473 = pnc1(validAll473) ; 
time473 = time(validAll473) ;
run478 = latt(validAll478) ;
pnc1478 = pnc1(validAll478) ; 
time478 = time(validAll478) ;
run479 = latt(validAll479) ;
pnc1479 = pnc1(validAll479) ; 
time479 = time(validAll479) ;

%finding the distance
%run 473 
pnc1473 = pnc1(validAll473) ;
long473 = long(validAll473) ; 

%473
column473 = pnc1473 ;
out = reshape(column473(1:5360), [], 40);
means473 = mean(out, 2);
timeforMeans473 = time473(40:40:end) ;
lattMeans473 = run473(40:40:end) ; 
longMeans473 = long473(40:40:end) ; 

a = 1 ; 

for k = (1:length(lattMeans473)) 
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

[sortedDist2, sortIndex] = sort(dist473) ;
sortedPNC12 = means473(sortIndex)  ;


% x = double(unique(sortedDist2 ) );
% v = double(sortedPNC12(x) );
% xq = linspace(min(x), max(x) , 50); 
% vq1 = pchip(x,v,xq);


%for 478
pnc1478 = pnc1(validAll478) ;
long478 = long(validAll478) ; 

%478
column478 = pnc1478 ;
out = reshape(column478(1:5160), [], 40);
means478 = mean(out, 2);
timeforMeans478 = time478(40:40:end) ;
lattMeans478 = run478(40:40:end) ; 
longMeans478 = long478(40:40:end) ; 

a = 1 ; 

for k = (1:length(lattMeans478)) 
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

[sortedDist3, sortIndex] = sort(dist478) ;
sortedPNC13 = means478(sortIndex)  ;

% x3 = sortedDist3  ;
% v3 = sortedPNC13 ;
% 
% xq3 = linspace(min(x3), max(x3) , 50); 
% vq3 = pchip(x3,v3,xq3);

%for 479
pnc1479 = pnc1(validAll479) ;
long479 = long(validAll479) ; 

%479
column479 = pnc1479 ;
out = reshape(column478(1:5040), [], 40);
means479 = mean(out, 2);
timeforMeans479 = time479(40:40:end) ;
lattMeans479 = run479(40:40:end) ; 
longMeans479 = long479(40:40:end) ; 

a = 1 ; 

for k = (1:length(lattMeans479)) 
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

[sortedDist4, sortIndex] = sort(dist479) ;
sortedPNC14 = means479(sortIndex)  ;

Ax = [sortedDist2(1:126)' , sortedDist3(1:126)' , sortedDist4' ] ;
Ay = [sortedPNC12(1:126) , sortedPNC13(1:126), sortedPNC14] ;

Max2 = max(Ay, [], 2) ; 
Min2 = min(Ay, [], 2) ;
Average_conc2 = mean(Ay, 2) ; 
Average_dist2 = mean(Ax, 2) ;

figure(1) %this is with interpolation
x = Average_dist2 ; 
p = fill([x;flipud(x)],[Min2;flipud(Max2)],'red')  ;
p.FaceColor = [1 0.8 0.8];      
p.EdgeColor = 'none';           
hold on
%p.FaceColor = [1 0.8 0.8];    
plot(Average_dist2, Average_conc2, 'k')
hold off
title('Average Concentration for Route 2 Runs 473, 478, and 479 with Variablity' )
xlabel('Distance from City (km)')
ylabel('Concentration (PNC1 - cm3)')