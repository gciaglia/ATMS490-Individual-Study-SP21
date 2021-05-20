clear all

long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

validAll470 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 & nrun == 470 ;
%for 470
latt470 = latt(validAll470) ;
time470 = time(validAll470) ;
pnc1470 = pnc1(validAll470) ;
long470 = long(validAll470) ; 
a = 1 ; 

for k = (1:3986) 
    Latt(a) = latt470(k) ;
    Long(a) = long470(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist470(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist470(a) = deg2km(dist470(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist470(a) = dist470(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end
figure(1)
plot(dist470, pnc1470) 

%lines are not in order, need to re order the rows
% M470 = [dist470', pnc1470] ; 
% A470 = sortrows(M470, 2, {'ascend'}) ;

[sortedDist, sortIndex] = sort(dist470) ;
sortedPNC1 = pnc1470(sortIndex)  ;

figure(2)
scatter(sortedDist,sortedPNC1)
figure(3)
plot(sortedDist,sortedPNC1)

%trying for route 2
validAll472 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 472 ;
latt472 = latt(validAll472) ;
time472 = time(validAll472) ;
pnc1472 = pnc1(validAll472) ;
long472 = long(validAll472) ; 
a = 1 ; 
z = length(latt472) ; 
for k = (1:z) 
    Latt(a) = latt472(k) ;
    Long(a) = long472(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist472(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist472(a) = deg2km(dist472(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist472(a) = dist472(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end
figure(1)
plot(dist472, pnc1472) 

%lines are not in order, need to re order the rows
% M470 = [dist470', pnc1470] ; 
% A470 = sortrows(M470, 2, {'ascend'}) ;

[sortedDist2, sortIndex] = sort(dist472) ;
sortedPNC12 = pnc1472(sortIndex)  ;

figure(2)
scatter(sortedDist2,sortedPNC12)
figure(3)
plot(sortedDist2,sortedPNC12)

%try new method with interpolation to get less points
x = dist472;
y = double(pnc1472)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix472= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A472 = sortrows(matrix472, 1, {'ascend'}) ;

x = dist470;
y = double(pnc1470)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix470= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A470 = sortrows(matrix470, 1, {'ascend'}) ;

figure(4)
plot(A472(:,1),A472(:,2))
hold on
plot(A470(:,1),A470(:,2))
hold off

%for all of route 2






