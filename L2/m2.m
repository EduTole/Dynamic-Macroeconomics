%% Informacion de ruta de carpeta
clc;
clear all;
close all;

%% Usando informacion de los files
% ------------------------------------------
% informacion del archivo
% ------------------------------------------
imputfile = 'pwt1001.xlsx';

%% Leer informacion de tabla

% ------------------------------------------
% carga la informacion
% ------------------------------------------
T = readtable(imputfile, 'sheet','Data');
head(T);

%% Manupilacion de datos
% Filtro de paises 
table(unique(T.country))
table(unique(T.year))

% filtro de paises
peru = T(T.country=="Peru",:);
peru = peru(:,4:end);
head(peru)

% Grafico de dispersion 
logpbi = log(peru.rgdpe);
logemp = log(peru.emp);
periodo = 1950:2019;
size(periodo)

% grafico conjunto 
clc;
figure
plot(periodo,logpbi, 'r',...
    periodo, logemp, '-b');
ylabel('Values - log')
xlabel('')
grid on 
saveas(gcf,'Figura4','png')

% Grafico de casos ejes diferentes
clc;
figure
yyaxis right 
plot(periodo,logpbi, 'r');
ylabel('Log - values')
yyaxis left
plot(periodo, logemp, '-b');
ylabel('Values - log')
legend('Empleo','PBI','Location','SW')
grid on 
saveas(gcf,'Figura5','png')

% Grafico de lineas diferentes
clc;
figure
tiledlayout(1,2)
nexttile
plot(periodo, logpbi,'r');
legend('PBI', 'Location','NW')
ylabel('Values - log')
xlabel('')
grid on 
nexttile
plot(periodo, logemp,'-b');
legend('Empleo', 'Location','NW')
ylabel('Values - log')
xlabel('')
grid on 
saveas(gcf,'Figura5','png')

%% Tasas de crecimiento 
clc;
head(peru)

growthpbi = (peru.rgdpe(2:end) ./ peru.rgdpe(1:end-1)-1)*100;
growthemp = (peru.emp(2:end) ./ peru.emp(1:end-1)-1)*100;
growtconsumo = (peru.ccon(2:end) ./ peru.ccon(1:end-1)-1)*100; 


figure 
plot(peru.year(2:end), growthpbi,'b',...
    peru.year(2:end),growthemp, 'r');
xlabel('');
ylabel('Crecimiento %');
%ylim(min(peru))
legend('PBI', 'Empleo','Location','SW')
grid on

figure 
plot(peru.year(2:end), growthpbi,'b',...
    peru.year(2:end),growtconsumo, 'r');
xlabel('');
ylabel('Crecimiento %');
legend('PBI', 'Consumo Privado','Location','SW')
grid on

% Consumo vs PBI (crecimiento)
figure 
plot(peru.year(2:end), growthpbi,'b',...
    peru.year(2:end),growtconsumo, 'r');
xlabel('');
ylabel('Crecimiento %');
xlim([min(2000) max(2019)])
legend('PBI', 'Consumo Privado','Location','SW')
grid on


%% Informacion de grafico de puntos 
% grafico de dispersion 

paises = T(T.year==2018,:);
logpbi = log(paises.rgdpe);
logemp = log(paises.emp);

clc;
figure
scatter(logemp, logpbi);
xlabel('Log- Empleo');
ylabel('Log - PBI');
grid on

clc;
figure
scatter(logemp, logpbi);
xlabel('Log- Empleo');
ylabel('Log - PBI');
text(logemp, logpbi,paises.country, ...
    'Vert','bottom', 'Horiz','left',...
    'FontSize',6)
grid on












