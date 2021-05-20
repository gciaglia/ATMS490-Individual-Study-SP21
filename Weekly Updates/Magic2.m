clear all

long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

% valid = latt >= -90 & long >= -90 & pnc1 > -999 & route == 2 ;
% unique(nrun(valid))

nrunner = [472] ; %,473,478,479 ] ;

for  i = length(nrunner)
validallIdx = latt >= -90 & long >= -90 & pnc1 > -999 & route == 2 & nrun == nrunner(i);
lattitude = latt(validallIdx) ;
longitude = long(validallIdx) ;
concentration = pnc1(validallIdx) ; 

z = length(lattitude) ; 
a = 1 ; 
    for k = (1:z) 
        Latt(a) = lattitude(k) ;
        Long(a) = longitude(k) ;

        %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
        dist(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
        dist(a) = deg2km(dist(a)) ;
        if Latt(a) > 49.0069
            if Long(a) >  8.4037 
            dist(a) = dist(a) * (-1) ;
            end
        end
        distCollection = dist(a) ; 
a = a + 1 ;

    end


end

figure(1)
plot(dist, concentration) 

[sortedDist2, sortIndex] = sort(dist) ;
sortedPNC12 = concentration(sortIndex)  ;

figure(2)
scatter(sortedDist2,sortedPNC12)
figure(3)
plot(sortedDist2,sortedPNC12)

%try new method with interpolation to get less points
x = dist;
y = double(concentration)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A = sortrows(matrix, 1, {'ascend'}) ;

figure(4)
plot(A(:,1),A(:,2))
