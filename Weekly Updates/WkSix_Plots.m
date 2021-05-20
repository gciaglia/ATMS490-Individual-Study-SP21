%Date 3/3/2021
%Goal is to develop upon Plotting to a concentration versus time 
%of a single run time

%I ahve been using masked arrays up ot this point and will try to replicate
%previous work done in python

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% One Run for Rt. 2

validAllIdx = latt >= -90 & long >= 8 & pnc1 > -999 &route == 2;

pnc1FilteredFig2 = pnc1(validAllIdx) ;
lattFiltered = latt(validAllIdx);
longFiltered = long(validAllIdx);

matrix_DUP = [lattFiltered,longFiltered, pnc1FilteredFig2] ;
matrix_DUP = [lattFiltered,longFiltered, pnc1FilteredFig2] ; 
table_DUP = table(lattFiltered,longFiltered, pnc1FilteredFig2, 'VariableNames',{'x','y','z'}) ; %create table of values
Non_rep = unique(table_DUP) ; %find the non duplicates
non_dupPNC1 = unique(pnc1FilteredFig2) ; %did not use
non_dupLatt = unique(lattFiltered) ; %did not use
% 
% figure(2)
% geobubble(Non_rep.x, Non_rep.y ,Non_rep.z );%Still contains duplicates


%now trying to get a single run, in paper mentions it is 50 min and 70 min
%maybe
% A = [pnc1FilteredFig2, lattFiltered, longFiltered]  ; 
% [C,ia,ib] = intersect(A(:,2),A(:,3),'stable');                  % Columns (2,3) Value Intersections
% for k = 1:numel(ia)
%     Ac = {A(ia(k),:), A(ib(k),:)};                              % Cell Array Of ‘Matching’ Rows
%     [~,Ix1] = max([A(ia(k),1), A(ib(k),1)]);                    % Index Of Maximum Of ‘Ac’
%     A(k,:) = Ac{Ix1};                                      % Preliminary Output Matrix
% end
% Ix2 = setdiff((1:size(A,1)), [ia; ib]);                         % Other Rows
% Output = [A; A(Ix2,:)]                                     % Complete Output Matrix

time_1run = (timeFiltered(1:3001));
time_1run_min = (timeFiltered(1:3001)- 5820874) * 0.0166667  ; %start at zero and convert to min
pnc1_1run = pnc1Filtered(1:3001) ;

figure(2) %one run time for route 2
plot(time_1run, pnc1_1run) 
title('Time versus PNC1 on Route 2 for 50 minutes')
xlabel('Time (s), 50 Minute Interval')
ylabel('particle number concentrations between 10 nm and 3 mu')

% ax1 = gca;
% ax1.XColor = 'r' ; 
% ax1.YColor = 'r' ; 
% ax1_pos = ax1.Position; % position of first axes
% ax2 = axes('Position',ax1_pos,...
%     'XAxisLocation','top',...
%     'YAxisLocation','right',...
%     'Color','none');
% x2 = time_1run_min ; 
% y2 = pnc1_1run ;
% line(x2,y2,'Parent', ax2, 'Color', 'k') 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lat and Long for One Run
latt_1run = lattFiltered(1:3001) ;
long_1run = longFiltered(1:3001) ;
pnc1_1runFig3 = pnc1FilteredFig2(1:3001);

figure(3) %this is a plot of the route wrt to Longitude and Lattitude
geobubble(latt_1run, long_1run, pnc1_1runFig3 );
title('Route 2 for 50 Minute Run')

figure(4)
latt_1runFig4 = lattFiltered(1:61) ;
long_1runFig4 = longFiltered(1:61) ;
pnc1_1runFig4 = pnc1FilteredFig2(1:61);
geobubble(latt_1runFig4, long_1runFig4, pnc1_1runFig4);
title('Route 2 for 1 Minute Run')

figure(5)
validAllIdx2 = latt >= -90 & long >= 8 & pnc1 > -999 & tramvel > -999 & route == 2;

pnc1FilteredFig5 = pnc1(validAllIdx2) ;
lattFilteredFig5 = latt(validAllIdx2);
longFilteredFig5 = long(validAllIdx2);
longFilteredFig5 = long(validAllIdx2);
tramvelFig5 = tramvel(validAllIdx2) ; 

latt_1runFig5 = lattFilteredFig5(1:61) ;
long_1runFig5 = longFilteredFig5(1:61) ;
pnc1_1runFig5 = pnc1FilteredFig5(1:61);
velT_1runFig5 = tramvelFig5(1:61);

table_1Min= table(latt_1runFig5,long_1runFig5, pnc1_1runFig5,velT_1runFig5,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','PNC1');
gb.SourceTable.Velocity = discretize(table_1Min.TramVel,[0 0.10 0.50 1.5 5 10 13 17],...
    'categorical', {'0 - 0.1 m/s', '0.1 - 0.5 m/s', '0.5 - 1.5 m/s', '1.5 - 5.0 m/s',...
    '5.0 - 10.0 m/s','10.0 - 13.0 m/s','13.0  17.0 m/s'});
gb.ColorVariable = 'Velocity';
title('Route 2 for 1 Minute Run')

figure(6)
validAllIdx2 = latt >= -90 & long >= 8 & pnc1 > -999 & tramvel > -999 & route == 2;

pnc1FilteredFig5 = pnc1(validAllIdx2) ;
lattFilteredFig5 = latt(validAllIdx2);
longFilteredFig5 = long(validAllIdx2);
longFilteredFig5 = long(validAllIdx2);
tramvelFig5 = tramvel(validAllIdx2) ; 

latt_1runFig5 = lattFilteredFig5(1:61) ;
long_1runFig5 = longFilteredFig5(1:61) ;
pnc1_1runFig5 = pnc1FilteredFig5(1:61);
velT_1runFig5 = tramvelFig5(1:61);

table_1Min= table(latt_1runFig5,long_1runFig5, pnc1_1runFig5,velT_1runFig5,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','TramVel');
gb.SourceTable.ParticleConc = discretize(table_1Min.PNC1,[0 5000 14000 16000 20000 30000 42000],...
    'categorical', {'0 - 5000 cm3', '5000 - 14000 cm3', '14000 - 16000 cm3', ...
    '16000 - 20000 cm3','20000 - 30000 cm3','30000 - 42000 cm3'});
gb.ColorVariable = 'ParticleConc';

neworder = {'30000 - 42000 cm3','20000 - 30000 cm3','16000 - 20000 cm3',...
    '14000 - 16000 cm3','5000 - 14000 cm3','0 - 5000 cm3'};
gb.SourceTable.ParticleConc = reordercats(gb.SourceTable.ParticleConc,neworder);
gb.BubbleColorList = autumn(7);
title('Route 2 for 1 Minute Run')
gb.SizeLegendTitle = 'Tram Velocity (m/s)';
gb.ColorLegendTitle = 'Particle Concentation';

