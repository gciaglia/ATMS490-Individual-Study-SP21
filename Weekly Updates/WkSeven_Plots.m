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


% figure(1) %this figure is the concentration versus time for all data collected
% plot(timeFiltered , pnc1Filtered) 
% title('Time versus PNC1 on Route 2')
% xlabel('Time (s)')
% ylabel('particle number concentrations between 10 nm and 3 mu')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% One Run for Rt. 2

validAllIdx = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun == 472;

pnc1FilteredFig2 = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);
runFiltered = nrun(validAllIdx) ; 
timeFilteredFig2 = time(validAllIdx) ;



% latt_1run = lattFiltered;
% long_1run = longFiltered;
% pnc1_1runFig2 = pnc1FilteredFig2;
% 
% figure(1) %this is a plot of the route wrt to Longitude and Lattitude
% geobubble(latt_1run, long_1run, pnc1_1runFig2 );
% title('Route 2 for Run 472')
% 
% figure(2) 
% plot((timeFilteredFig2 - 5820874) , pnc1_1runFig2);
% xlabel('Time (seconds)')
% ylabel('PNC1 Concentration')
% title('Route 2 for Run 472')
% 
% %Now trying to get averages for every 40 seconds with 1600 values
% 
% column2 = pnc1_1runFig2 ;
% out = reshape(column2(1:1600), [], 40);
% means40sec = mean(out, 2);
% 
% timeforMeans = timeFilteredFig2(40:40:end) ;
% lattMeans = latt_1run(40:40:end) ; 
% longMeans = long_1run(40:40:end) ; 
% 
% figure(3) %this is a plot of the route wrt to Longitude and Lattitude
% geobubble(lattMeans, longMeans, means40sec );
% title('Route 2 for Run 472 averaged every 40 Runs')
% 
% figure(4) 
% plot((timeforMeans - 5820874) , means40sec);
% xlabel('Time (seconds)')
% ylabel('PNC1 Concentration')
% title('Route 2 for Run 472 averaged every 40 Runs')
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
% figure(5) %this is a plot of the route wrt to Longitude and Lattitude
% geobubble(lattMeans2, longMeans2, means20sec );
% title('Route 2 for Run 472 averaged every 20 Runs')
% 
% figure(6) 
% plot((timeforMeans2 - 5820874) , means20sec);
% xlabel('Time (seconds)')
% ylabel('PNC1 Concentration')
% title('Route 2 for Run 472 averaged every 20 Runs')

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting Several Runs for the Same Route
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

figure(7) %proves they are all diff run times
% plot(timeFilteredR2, pnc1FilteredR2) 
% hold on
plot(timeFilteredR472, pnc1FilteredR472) 
hold on
plot(timeFilteredR473, pnc1FilteredR473)
plot(timeFilteredR478, pnc1FilteredR478)
plot(timeFilteredR479, pnc1FilteredR479)
hold off
legend('Run 472', 'Run 473' , 'Run 478', 'Run 479')

figure(8) %overlap 
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

%478
column478 = pnc1FilteredR478 ;
out = reshape(column478(1:5160), [], 40);
means478 = mean(out, 2);
timeforMeans478 = timeFilteredR478(40:40:end) ;
lattMeans478 = lattFilteredR478(40:40:end) ; 
longMeans478 = longFilteredR478(40:40:end) ; 

%479
column479 = pnc1FilteredR479 ;
out = reshape(column478(1:5040), [], 40);
means479 = mean(out, 2);
timeforMeans479 = timeFilteredR479(40:40:end) ;
lattMeans479 = lattFilteredR479(40:40:end) ; 
longMeans479 = longFilteredR479(40:40:end) ; 

figure(9) 
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

% addign color tying PNC to route/ run maybe
figure(10)

%472
column472 = pnc1FilteredR472 ;
out = reshape(column472(1:1600), [], 40);
means472 = mean(out, 2);
timeforMeans472 = timeFilteredR472(40:40:end) ;
lattMeans472 = lattFilteredR472(40:40:end) ; 
longMeans472 = longFilteredR472(40:40:end) ; 
run472 = runFilteredR472(40:40:end) ; 

%473
column473 = pnc1FilteredR473 ;
out = reshape(column473(1:5360), [], 40);
means473 = mean(out, 2);
timeforMeans473 = timeFilteredR473(40:40:end) ;
lattMeans473 = lattFilteredR473(40:40:end) ; 
longMeans473 = longFilteredR473(40:40:end) ; 
run473 = runFilteredR473(40:40:end) ; 

lattCombo = [lattMeans472 ; lattMeans473] ;
longCombo = [longMeans472 ; longMeans473] ;
meansCombo = [means472 ; means473] ;
runCombo = [run472 ; run473] ;

table_1Min= table(lattCombo,longCombo, meansCombo,runCombo,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','Run'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Runs = discretize(table_1Min.Run,[0 473 474],...
    'categorical', {'Run 472', 'Run 473'});
gb.ColorVariable = 'Runs';
title('Route 2 for Run 472 and 473 ')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Using route 3 with 2 runs
validAllIdxRt3 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 3 & nrun > -999;

pnc1FilteredR3 = pnc1(validAllIdxRt3) ;
lattFilteredR3 = latt(validAllIdxRt3);
longFilteredR3 = long(validAllIdxRt3);
runFilteredR3 = nrun(validAllIdxRt3) ; 
timeFilteredR3 = time(validAllIdxRt3) ;

%run 470
validAllIdxR470 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 3 & nrun == 470;
pnc1FilteredR470 = pnc1(validAllIdxR470) ;
lattFilteredR470 = latt(validAllIdxR470);
longFilteredR470 = long(validAllIdxR470);
runFilteredR470 = nrun(validAllIdxR470) ; 
timeFilteredR470 = time(validAllIdxR470) ;

%run 471
validAllIdxR471 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 3 & nrun == 471;
pnc1FilteredR471 = pnc1(validAllIdxR471) ;
lattFilteredR471 = latt(validAllIdxR471);
longFilteredR471 = long(validAllIdxR471);
runFilteredR471 = nrun(validAllIdxR471) ; 
timeFilteredR471 = time(validAllIdxR471) ;

%470
column470 = pnc1FilteredR470 ;
out = reshape(column470(1:3960), [], 40);
means470 = mean(out, 2);
timeforMeans470 = timeFilteredR470(40:40:end) ;
lattMeans470 = lattFilteredR470(40:40:end) ; 
longMeans470 = longFilteredR470(40:40:end) ; 
run470 = runFilteredR470(40:40:end) ; 

%471
column471 = pnc1FilteredR471 ;
out = reshape(column471(1:4040), [], 40);
means471 = mean(out, 2);
timeforMeans471 = timeFilteredR471(40:40:end) ;
lattMeans471 = lattFilteredR471(40:40:end) ; 
longMeans471 = longFilteredR471(40:40:end) ; 
run471 = runFilteredR471(40:40:end) ; 

lattComboR3 = [lattMeans470 ; lattMeans471] ;
longComboR3 = [longMeans470 ; longMeans471] ;
meansComboR3 = [means470 ; means471] ;
runComboR3 = [run470 ; run471] ;

table_R3= table(lattComboR3,longComboR3, meansComboR3,runComboR3,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','Run'}) ;
% table_R3.PNC1 = categorical(table_R3.PNC1);

figure(11)
gb = geobubble(table_R3, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Runs = discretize(table_R3.Run,[0 471 472],...
    'categorical', {'Run 470', 'Run 471'});
gb.ColorVariable = 'Runs';
title('Route 3 for Run 470 and 471 ')

figure(12) %combining route 2 and 3 470-473

lattComboR2a3 = [lattMeans470 ; lattMeans471 ; lattMeans472 ; lattMeans473] ;
longComboR2a3 = [longMeans470 ; longMeans471 ; longMeans472 ; longMeans473] ;
meansComboR2a3 = [means470 ; means471; means472 ; means473] ;
runComboR2a3 = [run470 ; run471 ; run472 ; run473] ;
table_R2a3= table(lattComboR2a3,longComboR2a3, meansComboR2a3,runComboR2a3,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','Run'}) ;
% table_R3.PNC1 = categorical(table_R3.PNC1);

gb = geobubble(table_R2a3, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Runs = discretize(table_R2a3.Run,[0 471 472 473 474],...
    'categorical', {'Run 470', 'Run 471','Run 472', 'Run 473'});
gb.ColorVariable = 'Runs';
title('Route 2 and 3 for Runs 470-473 ')

%% trying contour again lol
%run 472
validAllIdxR472 = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2 & nrun == 472;
pnc1FilteredR472 = pnc1(validAllIdxR472) ;
lattFilteredR472 = latt(validAllIdxR472);
longFilteredR472 = long(validAllIdxR472);
runFilteredR472 = nrun(validAllIdxR472) ; 
timeFilteredR472 = time(validAllIdxR472) ;

%472
column472 = pnc1FilteredR472 ;
out = reshape(column472(1:1600), [], 40);
means472 = mean(out, 2);
timeforMeans472 = timeFilteredR472(40:40:end) ;
lattMeans472 = lattFilteredR472(40:40:end) ; 
longMeans472 = longFilteredR472(40:40:end) ; 
run472 = runFilteredR472(40:40:end) ; 

x = lattMeans472 ; 
y = longMeans472 ; 
z = means472; 
% create xy axis grid
[X,Y] = meshgrid(x,y);
% create corresponding Z values, assume z = 0 for locations with no z data
Z = zeros(length(x),length(y)) ;
for i = 1:length(x)
    for j = 1:length(y)
        if i==j % z data exist for only for x(n) y(n) location, n = 1,2,3...
        Z(i,j) = z(i);
        end
    end
end

figure(13) 
contourf(X,Y,Z)

%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Old Code WK6 Below
% figure(4)
% latt_1runFig4 = lattFiltered(1:61) ;
% long_1runFig4 = longFiltered(1:61) ;
% pnc1_1runFig4 = pnc1FilteredFig2(1:61);
% geobubble(latt_1runFig4, long_1runFig4, pnc1_1runFig4);
% title('Route 2 for 1 Minute Run')
% 
% figure(5)
% validAllIdx2 = latt >= -90 & long >= 8 & pnc1 > -999 & tramvel > -999 & route == 2;
% 
% pnc1FilteredFig5 = pnc1(validAllIdx2) ;
% lattFilteredFig5 = latt(validAllIdx2);
% longFilteredFig5 = long(validAllIdx2);
% longFilteredFig5 = long(validAllIdx2);
% tramvelFig5 = tramvel(validAllIdx2) ; 
% 
% latt_1runFig5 = lattFilteredFig5(1:61) ;
% long_1runFig5 = longFilteredFig5(1:61) ;
% pnc1_1runFig5 = pnc1FilteredFig5(1:61);
% velT_1runFig5 = tramvelFig5(1:61);
% 
% table_1Min= table(latt_1runFig5,long_1runFig5, pnc1_1runFig5,velT_1runFig5,... 
%     'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% % table_1Min.PNC1 = categorical(table_1Min.PNC1);
% 
% gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','PNC1');
% gb.SourceTable.Velocity = discretize(table_1Min.TramVel,[0 0.10 0.50 1.5 5 10 13 17],...
%     'categorical', {'0 - 0.1 m/s', '0.1 - 0.5 m/s', '0.5 - 1.5 m/s', '1.5 - 5.0 m/s',...
%     '5.0 - 10.0 m/s','10.0 - 13.0 m/s','13.0  17.0 m/s'});
% gb.ColorVariable = 'Velocity';
% title('Route 2 for 1 Minute Run')
% 
% figure(6)
% validAllIdx2 = latt >= -90 & long >= 8 & pnc1 > -999 & tramvel > -999 & route == 2;
% 
% pnc1FilteredFig5 = pnc1(validAllIdx2) ;
% lattFilteredFig5 = latt(validAllIdx2);
% longFilteredFig5 = long(validAllIdx2);
% longFilteredFig5 = long(validAllIdx2);
% tramvelFig5 = tramvel(validAllIdx2) ; 
% 
% latt_1runFig5 = lattFilteredFig5(1:61) ;
% long_1runFig5 = longFilteredFig5(1:61) ;
% pnc1_1runFig5 = pnc1FilteredFig5(1:61);
% velT_1runFig5 = tramvelFig5(1:61);
% 
% table_1Min= table(latt_1runFig5,long_1runFig5, pnc1_1runFig5,velT_1runFig5,... 
%     'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% % table_1Min.PNC1 = categorical(table_1Min.PNC1);
% 
% gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','TramVel');
% gb.SourceTable.ParticleConc = discretize(table_1Min.PNC1,[0 5000 14000 16000 20000 30000 42000],...
%     'categorical', {'0 - 5000 cm3', '5000 - 14000 cm3', '14000 - 16000 cm3', ...
%     '16000 - 20000 cm3','20000 - 30000 cm3','30000 - 42000 cm3'});
% gb.ColorVariable = 'ParticleConc';
% 
% neworder = {'30000 - 42000 cm3','20000 - 30000 cm3','16000 - 20000 cm3',...
%     '14000 - 16000 cm3','5000 - 14000 cm3','0 - 5000 cm3'};
% gb.SourceTable.ParticleConc = reordercats(gb.SourceTable.ParticleConc,neworder);
% gb.BubbleColorList = autumn(7);
% title('Route 2 for 1 Minute Run')
% gb.SizeLegendTitle = 'Tram Velocity (m/s)';
% gb.ColorLegendTitle = 'Particle Concentation';