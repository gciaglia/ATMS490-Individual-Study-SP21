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

[sortedDist2, sortIndex] = sort(dist2) ;
sortedPNC12 = means2(sortIndex)  ;


x = sortedDist2  ;
v = sortedPNC12 ;
% 
% figure(1)
% plot(x,v)

xq = linspace(min(x), max(x) , 50); 
vq1 = pchip(x,v,xq);

figure(2)
plot(xq,vq1,':.');

%adding route 3 to route 2

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

dist3 = dist3(1:824) ; 
means3 = means3(1:824) ;

[sortedDist3, sortIndex] = sort(dist3) ;
sortedPNC13 = means3(sortIndex)  ;

x3 = sortedDist3  ;
v3 = sortedPNC13 ;

% figure(1)
% plot(x3,v3)

xq3 = linspace(min(x3), max(x3) , 50); 
vq3 = pchip(x3,v3,xq3);

figure(3)
plot(xq,vq1,':.');
hold on
plot(xq3,vq3,':.');
hold off

%adding route 4
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

[sortedDist4, sortIndex] = sort(dist4) ;
sortedPNC14 = means4(sortIndex)  ;

x4 = sortedDist4  ;
v4 = sortedPNC14 ;

xq4 = linspace(min(x4), max(x4) , 50); 
vq4 = pchip(x4,v4,xq4);

figure(4)
plot(xq,vq1,':.');
hold on
plot(xq3,vq3,':.');
plot(xq4,vq4,':.');
hold off

Ax = [xq' , xq3' , xq4' ] ;
Ay = [vq1' , vq3', vq4' ] ;

Max2 = max(Ay, [], 2) ; 
Min2 = min(Ay, [], 2) ;
Average_conc2 = mean(Ay, 2) ; 
Average_dist2 = mean(Ax, 2) ;

figure(5) %this is with interpolation
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


%%%%Addding route 5

validAllIdxRt5 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 5 & nrun > -999;

pnc1FilteredR5 = pnc1(validAllIdxRt5) ;
lattFilteredR5 = latt(validAllIdxRt5);
longFilteredR5 = long(validAllIdxRt5);
runFilteredR5 = nrun(validAllIdxRt5) ; 
timeFilteredR5 = time(validAllIdxRt5) ;

column5 = pnc1FilteredR4 ;
q = length(column5) ;
c = idivide(int32(q),int32(500)) ; 
out = reshape(column5(1:c*500), [], 500);
means5 = mean(out, 2);
timeforMeans5 = timeFilteredR5(500:500:end) ;
lattMeans5 = lattFilteredR5(500:500:end)  ; 
longMeans5 = longFilteredR5(500:500:end)  ; 

a = 1 ; 
z = length(lattMeans5) ; 
for k = (1:z) 
    Latt(a) = lattMeans5(k) ;
    Long(a) = longMeans5(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist5(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist5(a) = deg2km(dist5(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist5(a) = dist5(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

[sortedDist5, sortIndex] = sort(dist5) ;
sortedPNC15 = means5(sortIndex)  ;

x5 = sortedDist5  ;
v5 = sortedPNC15 ;

xq5 = linspace(min(x5), max(x5) , 50); 
vq5 = pchip(x5,v5,xq5);

Ax = [xq' , xq3' , xq4' , xq5' ] ;
Ay = [vq1' , vq3', vq4', vq5'] ;

Max2 = max(Ay, [], 2) ; 
Min2 = min(Ay, [], 2) ;
Average_conc2 = mean(Ay, 2) ; 
Average_dist2 = mean(Ax, 2) ;

figure(6) %this is with interpolation
x = Average_dist2 ; 
p = fill([x;flipud(x)],[Min2;flipud(Max2)],'red')  ;
p.FaceColor = [1 0.8 0.8];      
p.EdgeColor = 'none';           
hold on
%p.FaceColor = [1 0.8 0.8];    
plot(Average_dist2, Average_conc2, 'k')
hold off
title('Average Concentration for Route 2,3,4, and 5 with Variablity' )
xlabel('Distance from City (km)')
ylabel('Concentration (PNC1 - cm3)')


%Adding Route 6
validAllIdxRt6 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 6 & nrun > -999;

pnc1FilteredR6 = pnc1(validAllIdxRt6) ;
lattFilteredR6 = latt(validAllIdxRt6);
longFilteredR6 = long(validAllIdxRt6);
runFilteredR6 = nrun(validAllIdxRt6) ; 
timeFilteredR6 = time(validAllIdxRt6) ;

column6 = pnc1FilteredR6 ;
q = length(column6) ;
c = idivide(int32(q),int32(500)) ; 
out = reshape(column6(1:c*500), [], 500);
means6 = mean(out, 2);
timeforMeans6 = timeFilteredR6(500:500:end) ;
lattMeans6 = lattFilteredR6(500:500:end)  ; 
longMeans6 = longFilteredR6(500:500:end)  ; 

a = 1 ; 
z = length(lattMeans6) ; 
for k = (1:z) 
    Latt(a) = lattMeans6(k) ;
    Long(a) = longMeans6(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist6(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist6(a) = deg2km(dist6(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist6(a) = dist6(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

[sortedDist6, sortIndex] = sort(dist6) ;
sortedPNC16 = means6(sortIndex)  ;

x6 = sortedDist6  ;
v6 = sortedPNC16 ;
% combo = [x6' , v6 ] ;
% unique_6 = unique(combo, 'rows' ) ; 
[x6_uni, ia, ic ]  = unique(x6) ; 
v6_uni = v6(ia) ; 

xq6 = linspace(min(x6_uni), max(x6_uni) , 50); 
vq6 = pchip(x6_uni,v6_uni,xq6);

Ax = [xq' , xq3' , xq4' , xq5', xq6' ] ;
Ay = [vq1' , vq3', vq4', vq5', vq6'] ;

Max2 = max(Ay, [], 2) ; 
Min2 = min(Ay, [], 2) ;
Average_conc2 = mean(Ay, 2) ; 
Average_dist2 = mean(Ax, 2) ;

figure(7) %this is with interpolation
x = Average_dist2 ; 
p = fill([x;flipud(x)],[Min2;flipud(Max2)],'red')  ;
p.FaceColor = [1 0.8 0.8];      
p.EdgeColor = 'none';           
hold on
%p.FaceColor = [1 0.8 0.8];    
plot(Average_dist2, Average_conc2, 'k')
hold off
title('Average Concentration for Route 2,3,4,5,6 with Variablity' )
xlabel('Distance from City (km)')
ylabel('Concentration (PNC1 - cm3)')

%Route 7 added
%Adding Route 6
validAllIdxRt7 = latt >= -90 & long >= 4 & pnc1 > -999 &route == 7 & nrun > -999;

pnc1FilteredR7 = pnc1(validAllIdxRt7) ;
lattFilteredR7 = latt(validAllIdxRt7);
longFilteredR7 = long(validAllIdxRt7);
runFilteredR7 = nrun(validAllIdxRt7) ; 
timeFilteredR7 = time(validAllIdxRt7) ;

column7 = pnc1FilteredR7 ;
q = length(column7) ;
c = idivide(int32(q),int32(500)) ; 
out = reshape(column7(1:c*500), [], 500);
means7 = mean(out, 2);
timeforMeans7 = timeFilteredR7(500:500:end) ;
lattMeans7 = lattFilteredR7(500:500:end)  ; 
longMeans7 = longFilteredR7(500:500:end)  ; 

a = 1 ; 
z = length(lattMeans7) ; 
for k = (1:z) 
    Latt(a) = lattMeans7(k) ;
    Long(a) = longMeans7(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist7(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist7(a) = deg2km(dist7(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist7(a) = dist7(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

[sortedDist7, sortIndex] = sort(dist7) ;
sortedPNC17 = means7(sortIndex)  ;

x7 = sortedDist7  ;
v7 = sortedPNC17 ;
% combo = [x6' , v6 ] ;
% unique_6 = unique(combo, 'rows' ) ; 
[x7_uni, ia, ic ]  = unique(x7) ; 
v7_uni = v7(ia) ; 

xq7 = linspace(min(x7_uni), max(x7_uni) , 50); 
vq7 = pchip(x7_uni,v7_uni,xq7);

Ax = [xq' , xq3' , xq4' , xq5', xq6', xq7' ] ;
Ay = [vq1' , vq3', vq4', vq5', vq6', vq7'] ;

Max2 = max(Ay, [], 2) ; 
Min2 = min(Ay, [], 2) ;
Average_conc2 = mean(Ay, 2) ; 
Average_dist2 = mean(Ax, 2) ;

figure(7) %this is with interpolation
x = Average_dist2 ; 
p = fill([x;flipud(x)],[Min2;flipud(Max2)],'red')  ;
p.FaceColor = [1 0.8 0.8];      
p.EdgeColor = 'none';           
hold on
%p.FaceColor = [1 0.8 0.8];    
plot(Average_dist2, Average_conc2, 'k')
hold off
title('Average Concentration for Route 2,3,4,5,6,7 with Variablity' )
xlabel('Distance from City (km)')
ylabel('Concentration (PNC1 - cm3)')