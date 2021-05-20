
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

no_duplicates = unique(dist3) ;%test, no values are not duplicated 


% figure(10)%i think the issue here is really that it is so small its being weird
% scatter(dist3, means50sec);
% xlabel('Distance from Karlsrune City')
% ylabel('Concentration')


%try to sort cause maybe plot is failing to plot correctly and data is not
%organized
matrix = [dist3', means50sec] ; 

B = sortrows(matrix, 1, {'ascend'}) ;

figure(1) 
plot(B(:,1), B(:,2))%OMG this works frick yea :) 
title('PNC1 Concentration for Route 2 Avg over 1000 Seconds')
xlabel('Distance from City')
ylabel('PNC1 Comcentration (cm3)')

%%
%---------------------------------------------------------------------------
%#####now trying to re establish to get all of pnc1 values ################

validAllIdx = latt >= -90 & long >= -90 & pnc1 > -999 ;

pnc1Filtered = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);
runFiltered = nrun(validAllIdx) ; 
timeFiltered = time(validAllIdx) ;

column = pnc1Filtered ;
out = reshape(column(1:8122000), [], 1000);
means1000sec = mean(out, 2);

lattMeans = lattFiltered(1000:1000:end) ; 
longMeans = longFiltered(1000:1000:end) ; 


a = 1 ; 

for k = (1:8122) 
    Latt(a) = lattMeans(k) ;
    Long(a) = longMeans(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist(a) = dist(a) * (-1) ;
        end
    end
    
    a = a + 1 ;
   
end

%no_duplicates2 = unique(dist);
%meanFiltered = means1000sec(no_duplicates2); %there are duplicates, about
%60 values of 8122 total

matrix = [dist', means1000sec] ; 

C = sortrows(matrix, 1, {'ascend'}) ;

figure(2)
plot(C(:,1), C(:,2)) %it works it is just busy
title('PNC1 Concentration for All Routes Avg over 1000 Seconds')
xlabel('Distance from City')
ylabel('PNC1 Comcentration (cm3)')

%%
%-------------------------------------------------------------------------
%################try again------------------------------------------------

validAllIdx = latt >= -90 & long >= -90 & pnc1 > -999 ;

pnc1Filtered = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);
runFiltered = nrun(validAllIdx) ; 
timeFiltered = time(validAllIdx) ;

column3 = pnc1Filtered ;
out = reshape(column3(1:8122400), [], 100);
means10000sec = mean(out, 2);

lattMeans1 = lattFiltered(100:100:end) ; 
longMeans1 = longFiltered(100:100:end) ; 


a = 1 ; 

for k = (1:81224)
    Latt(a) = lattMeans1(k) ;
    Long(a) = longMeans1(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist4(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist4(a) = dist4(a) * (-1) ;
        end
    end
    
    a = a + 1 ;
   
end

%no_duplicates2 = unique(dist);
%meanFiltered = means1000sec(no_duplicates2); %there are duplicates, about
%60 values of 8122 total

matrix = [dist4', means10000sec] ; 

D = sortrows(matrix, 1, {'ascend'}) ;
% 
figure(3)
plot(D(:,1), D(:,2))
title('PNC1 Concentration for All Routes Avg over 100 Seconds')
xlabel('Distance from City')
ylabel('PNC1 Comcentration (cm3)')

figure (4)
x = C(:,1) ; 
y = C(:,2) ; 
yy2 = smooth(x,y,0.1,'rloess');
plot(x,y,'b.',x,yy2,'r-')
title('PNC1 Concentration for All Routes Avg over 1000 Seconds Smoothed')
xlabel('Distance from City')
ylabel('PNC1 Comcentration (cm3)')

figure (5)
u = D(:,1) ; 
v = D(:,2) ; 
vv2 = smooth(u,v,0.1,'rloess');
plot(u,v,'b.',u,vv2,'r-')
title('PNC1 Concentration for All Routes Avg over 1000 Seconds Smoothed')
xlabel('Distance from City')
ylabel('PNC1 Comcentration (cm3)')

%%
%########################################################################


validAllIdx = latt >= -90 & long >= -90 & pnc1 > -999 ;

pnc1Filtered = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);
runFiltered = nrun(validAllIdx) ; 
timeFiltered = time(validAllIdx) ;

column5 = pnc1Filtered ;
out = reshape(column5(1:8120000), [], 10000);
means5sec = mean(out, 2);

lattMeans5 = lattFiltered(10000:10000:end) ; 
longMeans5 = longFiltered(10000:10000:end) ; 


a = 1 ; 

for k = (1:812)
    Latt5(a) = lattMeans5(k) ;
    Long5(a) = longMeans5(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist5(a) = distance(49.0069 , 8.4037 , Latt5(a), Long5(a) ) ; %origin, destination
    
    if Latt5(a) > 49.0069
        if Long5(a) >  8.4037 
        dist5(a) = dist5(a) * (-1) ;
        end
    end
    
    a = a + 1 ;
   
end

%no_duplicates2 = unique(dist);
%meanFiltered = means1000sec(no_duplicates2); %there are duplicates, about
%60 values of 8122 total

matrix = [dist5', means5sec] ; 

E = sortrows(matrix, 1, {'ascend'}) ;
% 
figure(6)
plot(E(:,1), E(:,2))
title('PNC1 Concentration for All Routes Avg over 10000 Seconds')
xlabel('Distance from City')
ylabel('PNC1 Comcentration (cm3)')

figure (7)
i = E(:,1) ; 
j = E(:,2) ; 
jj2 = smooth(i,j,0.1,'rloess');
plot(i,j,'b.',i,jj2,'r-')
title('PNC1 Concentration for All Routes Avg over 10000 Seconds Smoothed')
xlabel('Distance from City')
ylabel('PNC1 Comcentration (cm3)')

