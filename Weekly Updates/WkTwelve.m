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

validAll3 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 ;

runFiltTotal3 = nrun(validAll3) ;
theNrunsRt3 = unique(runFiltTotal3) ;


validAll470 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 & nrun == 470 ;
validAll471 = latt >= -90 & long >= -90 & pnc1 > -999 &route == 3 & nrun == 471 ;


run470 = latt(validAll470) ;
time470 = time(validAll470) ;
run471 = latt(validAll471) ;
time471 = time(validAll471) ;

figure(2) 
plot(time470, run470)




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
figure(7)
plot(dist470, pnc1470) 

% x = dist470;
% y = double(pnc1470)';
% t = 1:numel(x);
% xy = [x;y];
% pp = spline(t,xy);
% tInterp = linspace(1,numel(x));
% xyInterp = ppval(pp, tInterp);
% matrix470= [xyInterp(1,:)', xyInterp(2,:)'] ; 
% A470 = sortrows(matrix470, 1, {'ascend'}) ;

M470 = [dist470', pnc1470] ; 
A470 = sortrows(M470, 1, {'ascend'}) ;

figure(3)
plot(A470(:,1),A470(:,2))

% figure(4)
% geobubble( run470, long470, pnc1470) 
% 
% figure(5) 
% plot(run470, pnc1470) 
% 
% figure(6)
% plot(long470, pnc1470) 




% %for 471
% pnc1471 = pnc1(validAll471) ;
% long471 = long(validAll471) ; 
% a = 1 ; 
% 
% for k = (1:4078) 
%     Latt(a) = run471(k) ;
%     Long(a) = long471(k) ;
%       
%     %dist(a) = distance(Latt(a), Long(a) ,Latt2(a) , Long2(a)) ;
%     dist471(a) = distance(49.0069 , 8.4037 , Latt(a), Long(a) ) ; %origin, destination
%     dist471(a) = deg2km(dist471(a)) ;
%     if Latt(a) > 49.0069
%         if Long(a) >  8.4037 
%         dist471(a) = dist471(a) * (-1) ;
%         end
%     end
% 
%     a = a + 1 ;
%    
% end
% 
% x = dist471;
% y = double(pnc1471)';
% t = 1:numel(x);
% xy = [x;y];
% pp = spline(t,xy);
% tInterp = linspace(1,numel(x));
% xyInterp = ppval(pp, tInterp);
% matrix471= [xyInterp(1,:)', xyInterp(2,:)'] ; 
% A471 = sortrows(matrix471, 1, {'ascend'}) ;
% 
% figure(8)
% plot(A470(:,1),A470(:,2))
% hold on
% plot(A471(:,1),A471(:,2))
% % plot(A479(:,1),A479(:,2))
% % plot(A480(:,1),A480(:,2))
% % plot(A481(:,1),A481(:,2))
% hold off
% legend('Run 470','Run 471') %,'Run 479', 'Run 480', 'Run 481')
% title('Interpolation and Sorting of Several Runs in Route 3')
% xlabel('Distance from City (km)')
% ylabel('PNC1 Concentrations')


%route 2 check******************************************************

