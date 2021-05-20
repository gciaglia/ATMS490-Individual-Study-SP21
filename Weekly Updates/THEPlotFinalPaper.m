%Combining Routes for the final Paper
%Route 3 now with route 2 ##############################################

clear all

%Inmport all required data from NC file
long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]

validAllIdxRt2 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 2 & nrun > -999;

pnc1FilteredR2 = pnc1(validAllIdxRt2) ;
lattFilteredR2 = latt(validAllIdxRt2);
longFilteredR2 = long(validAllIdxRt2);
runFilteredR2 = nrun(validAllIdxRt2) ; 
timeFilteredR2 = time(validAllIdxRt2) ;

column2 = pnc1FilteredR2 ;
out = reshape(column2(1:412000), [], 500);
means2 = mean(out, 2);
timeforMeans2 = timeFilteredR2(500:500:end) ;
lattMeans2 = lattFilteredR2(500:500:end)  ; 
longMeans2 = longFilteredR2(500:500:end)  ; 


%For all of Route 2
a = 1 ; 
z = length(lattMeans2) ; 
for k = (1:z) 
    Latt(a) = lattMeans2(k) ;
    Long(a) = longMeans2(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist2(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist2(a) = deg2km(dist2(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist2(a) = dist2(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end


%Four Route 3
validAllIdxRt3 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 3 & nrun > -999;

pnc1FilteredR3 = pnc1(validAllIdxRt3) ;
lattFilteredR3 = latt(validAllIdxRt3);
longFilteredR3 = long(validAllIdxRt3);
runFilteredR3 = nrun(validAllIdxRt3) ; 
timeFilteredR3 = time(validAllIdxRt3) ;

column3 = pnc1FilteredR3 ;
out = reshape(column3(1:374920), [], 455);
means3 = mean(out, 2);
timeforMeans3 = timeFilteredR3(455:455:end) ;
lattMeans3 = lattFilteredR3(455:455:end)  ; 
longMeans3 = longFilteredR3(455:455:end)  ; 

a = 1 ; 
z = length(lattMeans3) ; 
for k = (1:z) 
    Latt(a) = lattMeans3(k) ;
    Long(a) = longMeans3(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist3(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist3(a) = deg2km(dist3(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist3(a) = dist3(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

%Route 4

validAllIdxRt4 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 4 & nrun > -999;

pnc1FilteredR4 = pnc1(validAllIdxRt4) ;
lattFilteredR4 = latt(validAllIdxRt4);
longFilteredR4 = long(validAllIdxRt4);
runFilteredR4 = nrun(validAllIdxRt4) ; 
timeFilteredR4 = time(validAllIdxRt4) ;

column4 = pnc1FilteredR4 ;
out = reshape(column4(1:407880), [], 495);
means4 = mean(out, 2);
timeforMeans4 = timeFilteredR4(495:495:end) ;
lattMeans4 = lattFilteredR4(495:495:end)  ; 
longMeans4 = longFilteredR4(495:495:end)  ; 

a = 1 ; 
z = length(lattMeans4) ; 
for k = (1:z) 
    Latt(a) = lattMeans4(k) ;
    Long(a) = longMeans4(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist4(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist4(a) = deg2km(dist4(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist4(a) = dist4(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

dist2 = dist2(1:824) ; 
means2_short = means2(1:824);
[sortedDist2, sortIndex] = sort(dist2) ;
sortedPNC12 = means2_short(sortIndex)  ;

dist3 = dist3(1:824) ; 
means3_short = means3(1:824);
[sortedDist3, sortIndex] = sort(dist3) ;
sortedPNC13 = means3_short(sortIndex)  ;

dist4 = dist4(1:824) ; 
means4_short = means4(1:824);
[sortedDist4, sortIndex] = sort(dist4) ;
sortedPNC14 = means4_short(sortIndex)  ;

martix_of_all = [sortedPNC12, sortedPNC13, sortedPNC14] ;

Max = max(martix_of_all, [], 2) ; 
Min = min(martix_of_all, [], 2) ;
Average_conc = mean(martix_of_all, 2) ; 

matrix_dist = [sortedDist2', sortedDist3', sortedDist4'] ;
Average_dist = mean(matrix_dist, 2) ; 

figure(1) %this is without interpolation
x = Average_dist ; 
p = fill([x;flipud(x)],[Min;flipud(Max)],'red')  ;
p.FaceColor = [1 0.8 0.8];      
p.EdgeColor = 'none';           
hold on
%p.FaceColor = [1 0.8 0.8];    
plot(Average_dist, Average_conc, 'k')
hold off
title('Average Concentration for Route 2,3, and 4 with Variablity' )
xlabel('Distance from City (km)')
ylabel('Concentration (PNC1 - cm3)')


%%%%%%%%%%%%%%%%Trying Interpolation
x = dist2;
y = double(means2)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix2= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A2 = sortrows(matrix2, 1, {'ascend'}) ;


x = dist3;
y = double(means3)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix3= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A3 = sortrows(matrix3, 1, {'ascend'}) ;

x = dist4;
y = double(means4)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix4= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A4 = sortrows(matrix4, 1, {'ascend'}) ;


Ax = [ A2(:, 1), A3(:, 1), A4(:, 1) ] ;
Ay = [ A2(:, 2), A3(:, 2), A4(:, 2) ] ;

%martix_of_all = [sortedPNC12, sortedPNC13, sortedPNC14] ;

Max2 = max(Ay, [], 2) ; 
Min2 = min(Ay, [], 2) ;
Average_conc2 = mean(Ay, 2) ; 
%matrix_dist = [sortedDist2', sortedDist3', sortedDist4'] ;
Average_dist2 = mean(Ax, 2) ; 

figure(2) %this is without interpolation
x = Average_dist2 ; 
p = fill([x;flipud(x)],[Min2;flipud(Max2)],'red')  ;
p.FaceColor = [1 0.8 0.8];      
p.EdgeColor = 'none';           
hold on
%p.FaceColor = [1 0.8 0.8];    
plot(Average_dist2, Average_conc2, 'k')
hold off
title('Average Concentration for Route 2,3, and 4 with Variablity' )
xlabel('Distance from City (km)')
ylabel('Concentration (PNC1 - cm3)')