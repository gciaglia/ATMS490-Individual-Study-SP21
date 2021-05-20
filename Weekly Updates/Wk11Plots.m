%week 11 plotting 

%goals are to converts last weeks plots to km
%and to determine where the Tram turns around after a specific time

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

validAll = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 ;
validAllIdx = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 472 ;
pnc1Filtered = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);
runFiltered = nrun(validAllIdx) ; %determine nruns in route in this value
timeFiltered = time(validAllIdx) ;

runFiltTotal = nrun(validAll) ;
theNrunsRt2 = unique(runFiltTotal) ;

%time against a nrun value
% figure(1)
% plot(timeFiltered, lattFiltered) 
% title('Lattitude verus the Time for Single run 472, Route 2') 

%tie together severl nrun values: specifically 472, 473, 478, 479, 480, 481,
%520

validAll472 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 472 ;
validAll473 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 473 ;
validAll478 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 478 ;
validAll479 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 479 ;
validAll480 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 480 ;
validAll481 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 481 ;
validAll520 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 520 ;

run472 = latt(validAll472) ;
time472 = time(validAll472) ;
run473 = latt(validAll473) ;
time473 = time(validAll473) ;
run478 = latt(validAll478) ;
time478 = time(validAll478) ;
run479 = latt(validAll479) ;
time479 = time(validAll479) ;
run480 = latt(validAll480) ;
time480 = time(validAll480) ;
run481 = latt(validAll481) ;
time481 = time(validAll481) ;
run520 = latt(validAll520) ;
time520 = time(validAll520) ;

% 
% figure(2)
% plot(time472, run472 ,'y')
% hold on
% plot(time473, run473, 'c') 
% plot(time478, run478 , 'r') 
% plot(time479, run479 ,'g')
% plot(time480, run480 , 'b')
% plot(time481, run481, 'm') 
% hold off
% %plot(time520, run520, 'm')
% legend('472', '473','478','479','480','481')
% title('Route 2 Lattitude verus Time (s) for Several Runs')
% 
% figure(3)
% runSort473 = sort(run473, 'descend') ;
% runSort479 = sort(run479, 'descend') ;
% runSort481 = sort(run481, 'descend') ;
% plot(time473 - 5822613, runSort473, 'c') %starts at [5822613]
% hold on 
% plot(time478 - 5852984, run478 , 'r') %starts at [5852984]
% plot(time479 - 5858758, runSort479 ,'g')%starts at [5858758]
% plot(time480 - time480(1), run480 , 'b') %starts at
% plot(time481 - time481(1), runSort481, 'm') %starts at 
% hold off
% legend('473','478','479','480','481')
% title('Route 2 Lattitude verus Time (s) Alignment for Several Runs')

% 
% figure(4)
% runSort473 = sort(run473, 'descend') ;
% runSort479 = sort(run479, 'descend') ;
% runSort481 = sort(run481, 'descend') ;
% plot(time473 - 5822613, run473, 'c') %starts at [5822613]
% hold on 
% plot(time478 - 5852984, run478 , 'r') %starts at [5852984]
% plot(time479 - 5858758, run479 ,'g')%starts at [5858758]
% plot(time480 - time480(1), run480 , 'b') %starts at
% plot(time481 - time481(1), run481, 'm') %starts at 
% hold off
% legend('473','478','479','480','481')
% title('Route 2 Lattitude verus Time Alignment for Several Runs')


%finding the distance
%run 473 
pnc1473 = pnc1(validAll473) ;
long473 = long(validAll473) ; 
a = 1 ; 

for k = (1:5378) 
    Latt(a) = run473(k) ;
    Long(a) = long473(k) ;
      
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

x = dist473 ;
y = double(pnc1473)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);

matrix = [xyInterp(1,:)', xyInterp(2,:)'] ; 

B = sortrows(matrix, 1, {'ascend'}) ;

%for 478
pnc1478 = pnc1(validAll478) ;
long478 = long(validAll478) ; 
a = 1 ; 

for k = (1:5198) 
    Latt(a) = run478(k) ;
    Long(a) = long478(k) ;
      
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

x = dist478 ;
y = double(pnc1478)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix478 = [xyInterp(1,:)', xyInterp(2,:)'] ; 
A478 = sortrows(matrix478, 1, {'ascend'}) ;

%for 479
pnc1479 = pnc1(validAll479) ;
long479 = long(validAll479) ; 
a = 1 ; 

for k = (1:5047) 
    Latt(a) = run479(k) ;
    Long(a) = long479(k) ;
      
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

x = dist479 ;
y = double(pnc1479)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix479 = [xyInterp(1,:)', xyInterp(2,:)'] ; 
A479 = sortrows(matrix479, 1, {'ascend'}) ;

%for 480
pnc1480 = pnc1(validAll480) ;
long480 = long(validAll480) ; 
a = 1 ; 

for k = (1:4915) 
    Latt(a) = run480(k) ;
    Long(a) = long480(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist480(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist480(a) = deg2km(dist480(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist480(a) = dist480(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

x = dist480;
y = double(pnc1480)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix480= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A480 = sortrows(matrix480, 1, {'ascend'}) ;

%for 481
pnc1481 = pnc1(validAll481) ;
long481 = long(validAll481) ; 
a = 1 ; 

for k = (1:4979) 
    Latt(a) = run481(k) ;
    Long(a) = long481(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist481(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist481(a) = deg2km(dist481(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist481(a) = dist481(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

x = dist481;
y = double(pnc1481)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix481= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A481 = sortrows(matrix481, 1, {'ascend'}) ;

figure(5)
plot(B(:,1),B(:,2))
hold on
plot(A478(:,1),A478(:,2))
plot(A479(:,1),A479(:,2))
plot(A480(:,1),A480(:,2))
plot(A481(:,1),A481(:,2))
hold off
legend('Run 473','Run 478','Run 479', 'Run 480', 'Run 481')
title('Interpolation and Sorting of Several Runs in Route 2')
xlabel('Distance from City (km)')
ylabel('PNC1 Concentrations')


M473 = [dist473', pnc1473] ; 
AA = sortrows(M473, 1, {'ascend'}) ;
M478 = [dist478', pnc1478] ; 
BB = sortrows(M478, 1, {'ascend'}) ;
M479 = [dist479', pnc1479] ; 
CC = sortrows(M479, 1, {'ascend'}) ;
M480 = [dist480', pnc1480] ; 
DD = sortrows(M480, 1, {'ascend'}) ;
M481 = [dist481', pnc1481] ; 
EE = sortrows(M481, 1, {'ascend'}) ;

figure(6)
plot(AA(:,1), AA(:,2) )
hold on
plot(BB(:,1), BB(:,2) )
plot(CC(:,1), CC(:,2) )
plot(DD(:,1), DD(:,2) )
plot(EE(:,1), EE(:,2) )
hold off
title('Sorting of Runs in Route 2')
xlabel('Distance from City (km)')
ylabel('PNC1 Concentrations')

%%
%######################################################Route Change

validAll3 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 ;
% validAllIdx = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 472 ;
% pnc1Filtered = pnc1(validAllIdx) ;
% lattFiltered = latt(validAllIdx);
% longFiltered = long(validAllIdx);
% runFiltered = nrun(validAllIdx) ; %determine nruns in route in this value
% timeFiltered = time(validAllIdx) ;

runFiltTotal3 = nrun(validAll3) ;
theNrunsRt3 = unique(runFiltTotal3) ;


validAll470 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 & nrun == 470 ;
validAll471 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 & nrun == 471 ;
% validAll478 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 478 ;
% validAll479 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 479 ;
% validAll480 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 480 ;
% validAll481 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 481 ;
% validAll520 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 2 & nrun == 520 ;

run470 = latt(validAll470) ;
time470 = time(validAll470) ;
run471 = latt(validAll471) ;
time471 = time(validAll471) ;
% run478 = latt(validAll478) ;
% time478 = time(validAll478) ;
% run479 = latt(validAll479) ;
% time479 = time(validAll479) ;
% run480 = latt(validAll480) ;
% time480 = time(validAll480) ;
% run481 = latt(validAll481) ;
% time481 = time(validAll481) ;
% run520 = latt(validAll520) ;
% time520 = time(validAll520) ;


figure(7)
plot(time470, run470 ,'y')
hold on
plot(time471, run471, 'c') 
% plot(time478, run478 , 'r') 
% plot(time479, run479 ,'g')
% plot(time480, run480 , 'b')
% plot(time481, run481, 'm') 
hold off
h = yline(49.0069, 'r--') ;
legend('470', '471') %,'478','479','480','481')
title('Route 3 Lattitude verus Time (s) for Several Runs')

%for 470
pnc1470 = pnc1(validAll470) ;
long470 = long(validAll470) ; 
a = 1 ; 

for k = (1:3986) 
    Latt(a) = run470(k) ;
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

x = dist470;
y = double(pnc1470)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix470= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A470 = sortrows(matrix470, 1, {'ascend'}) ;

%for 471
pnc1471 = pnc1(validAll471) ;
long471 = long(validAll471) ; 
a = 1 ; 

for k = (1:4078) 
    Latt(a) = run471(k) ;
    Long(a) = long471(k) ;
      
    %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
    dist471(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
    dist471(a) = deg2km(dist471(a)) ;
    if Latt(a) > 49.0069
        if Long(a) >  8.4037 
        dist471(a) = dist471(a) * (-1) ;
        end
    end

    a = a + 1 ;
   
end

x = dist471;
y = double(pnc1471)';
t = 1:numel(x);
xy = [x;y];
pp = spline(t,xy);
tInterp = linspace(1,numel(x));
xyInterp = ppval(pp, tInterp);
matrix471= [xyInterp(1,:)', xyInterp(2,:)'] ; 
A471 = sortrows(matrix471, 1, {'ascend'}) ;

figure(8)
plot(A470(:,1),A470(:,2))
hold on
plot(A471(:,1),A471(:,2))
% plot(A479(:,1),A479(:,2))
% plot(A480(:,1),A480(:,2))
% plot(A481(:,1),A481(:,2))
hold off
legend('Run 470','Run 471') %,'Run 479', 'Run 480', 'Run 481')
title('Interpolation and Sorting of Several Runs in Route 3')
xlabel('Distance from City (km)')
ylabel('PNC1 Concentrations')


%%
%#########################################################################
% column473 = pnc1473 ;
% out = reshape(column473(1:5360), [], 20);
% means20sec473 = mean(out, 2);
% run473 = run473(20:20:end) ; 
% long473 = long473(20:20:end) ; 
% a = 1 ; 
% 
% for k = (1:268)
%     Latt(a) = run473(k) ;
%     Long(a) = long473(k) ;
%       
%     %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%     dist1(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
%     dist1(a) = deg2km(dist1(a)) ;
%     if Latt(a) > 49.0069
%         if Long(a) >  8.4037 
%         dist1(a) = dist1(a) * (-1) ;
%         end
%     end
%     
%     a = a + 1 ;
%    
% end
% matrix = [dist1', means20sec473] ; 
% Four73 = sortrows(matrix, 1, {'ascend'}) ;
% 
% column478 = pnc1478 ;
% out = reshape(column478(1:5180), [], 20);
% means20sec478 = mean(out, 2);
% run478 = run478(20:20:end) ; 
% long478 = long478(20:20:end) ; 
% a = 1 ; 
% 
% for k = (1:259)
%     Latt(a) = run478(k) ;
%     Long(a) = long478(k) ;
%       
%     %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%     dist2(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
%     dist2(a) = deg2km(dist2(a)) ;
%     if Latt(a) > 49.0069
%         if Long(a) >  8.4037 
%         dist2(a) = dist2(a) * (-1) ;
%         end
%     end
%     
%     a = a + 1 ;
%    
% end
% matrix = [dist2', means20sec478] ; 
% Four78 = sortrows(matrix, 1, {'ascend'}) ;
% 
% figure(9)
% plot(Four73(:,1), Four73(:,2))
% hold on
% plot(Four78(:,1), Four78(:,2))
% hold off
% legend('473','478') 
% title('PNC1 Concentration for Route 2 Runs Avg over 20 Seconds')
% xlabel('Distance from City')
% ylabel('PNC1 Comcentration (cm3)')


run472 = latt(validAll472) ;
time472 = time(validAll472) ;
run473 = latt(validAll473) ;
time473 = time(validAll473) ;
run478 = latt(validAll478) ;
time478 = time(validAll478) ;
run479 = latt(validAll479) ;
time479 = time(validAll479) ;
run480 = latt(validAll480) ;
time480 = time(validAll480) ;
run481 = latt(validAll481) ;
time481 = time(validAll481) ;
run520 = latt(validAll520) ;
time520 = time(validAll520) ;

sort473 = [run473,pnc1473] ;

runSort473 = sortrows(sort473,2, 'descend') ;


% figure(10)
% plot(time473 - time473(1), pnc1473)
% hold on
% plot(time478 - time478(1), pnc1478)
% plot(time479 -  time479(1), pnc1479)
% plot(time479 -  time479(1), pnc1479)

