clear all

end_var  = ncread('Aerosolmodul_2010.nc','End'); %tram velocity [s]

index = end_var > -999 ;
Ends = end_var(index) ;
unique_values = unique(Ends) 

long = ncread('Aerosolmodul_2010.nc','lon');
latt = ncread('Aerosolmodul_2010.nc','lat');
route = ncread('Aerosolmodul_2010.nc','Route'); %focus on route 2
pnc1 = ncread('Aerosolmodul_2010.nc','PNC_1'); %concentration 
time  = ncread('Aerosolmodul_2010.nc','time'); %time [s]
tramvel  = ncread('Aerosolmodul_2010.nc','tram.vel'); %tram velocity [s]
nrun  = ncread('Aerosolmodul_2010.nc','nrun'); %tram velocity [s]
start  = ncread('Aerosolmodul_2010.nc','Start'); %tram velocity [s]

indexAll = latt >= -90 & long >= -90 & pnc1 > -999 & start == 110 & end_var == 110; 
routes = route(indexAll) ;
longitude = long(indexAll) ;
lattitude = latt(indexAll) ;
pnc_conc = pnc1(indexAll) ;
tramvelocity = tramvel(indexAll) ;


% z = length(pnc_conc) ; 
% a = 1 ;
%     for k = (1:z)
%         Latt(a) = lattitude(k) ;
%         Long(a) = longitude(k) ;
% 
%         %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%         dist(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
%         dist(a) = deg2km(dist(a)) ;
%         if Latt(a) > 49.0069
%             if Long(a) >  8.4037 
%             dist(a) = dist(a) * (-1) ;
%             end
%         end
% 
%         a = a + 1 ;
% 
%     end
% % end
% 


% 
% figure(1)
% plot(dist, pnc_conc) 
% 
% [sortedDist2, sortIndex] = sort(dist) ;
% sortedPNC12 = pnc_conc(sortIndex)  ;
% 
% figure(2)
% scatter(sortedDist2,sortedPNC12)
% figure(3)
% plot(sortedDist2,sortedPNC12)

%try new method with interpolation to get less points
% x = dist;
% y = double(pnc_conc)';
% t = 1:numel(x);
% xy = [x;y];
% pp = spline(t,xy);
% tInterp = linspace(1,numel(x));
% xyInterp = ppval(pp, tInterp);
% matrix= [xyInterp(1,:)', xyInterp(2,:)'] ; 
% A = sortrows(matrix, 1, {'ascend'}) ;

latt_1runFig5 = lattitude ; %(1:200) ;
long_1runFig5 = longitude ; %(1:200) ;
pnc1_1runFig5 = pnc_conc ; %(1:200);
velT_1runFig5 = tramvelocity ; %(1:200);

table_1Min= table(latt_1runFig5,long_1runFig5, pnc1_1runFig5,velT_1runFig5,... 
    'VariableNames',{'Lattitude','Longitude','PNC1','TramVel'}) ;
% table_1Min.PNC1 = categorical(table_1Min.PNC1);

gb = geobubble(table_1Min, 'Lattitude','Longitude','SizeVariable','TramVel');
% gb.SourceTable.ParticleConc = discretize(table_1Min.PNC1,[0 20000 21000 22000 23000 24000 25000 28000],...
%     'categorical', {'0 cm3', '20000', '21000 cm3', '22000 cm3' , '23000 cm3', '24000 cm3', '25000 cm3'});
gb.SourceTable.ParticleConc = discretize(table_1Min.PNC1,[0 10000 15000 20000 30000 40000 ],...
    'categorical', {'0-10000 cm3', '15000', '20000 cm3', '30000 cm3' , '40000 cm3', });

gb.ColorVariable = 'ParticleConc';

% neworder = {'30000 - 42000 cm3','20000 - 30000 cm3'};
% gb.SourceTable.ParticleConc = reordercats(gb.SourceTable.ParticleConc,neworder);
%gb.BubbleColorList = autumn(7);
title('start time for 110')
gb.SizeLegendTitle = 'Tram Velocity (m/s)';
gb.ColorLegendTitle = 'Particle Concentation';

