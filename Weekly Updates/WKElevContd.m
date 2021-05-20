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


pnc1473 = pnc1(validAll473) ;
s473 = [run473,pnc1473] ;
runSort473 = sortrows(s473,1, 'descend') ;

pnc1479 = pnc1(validAll479) ;
s479 = [run479,pnc1479] ;
runSort479 = sortrows(s479,1, 'descend') ;

pnc1481 = pnc1(validAll481) ;
s481 = [run481,pnc1481] ;
runSort481 = sortrows(s481,1, 'descend') ;

pnc1480 = pnc1(validAll480) ;
pnc1478 = pnc1(validAll478) ;

figure(10)
plot(time473 - time473(1), runSort473(:,2))
hold on
plot(time478 - time478(1), pnc1478)
plot(time479 -  time479(1), runSort479(:,2))
plot(time480 -  time480(1), pnc1480)
plot(time481 -  time481(1), runSort481(:,2))
hold off