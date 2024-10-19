%% Informacion de ruta de carpeta
clc;
clear all;
close all;

%% Usando informacion de los files
% ------------------------------------------
% informacion del archivo
% ------------------------------------------
imputfile = 'BD2.csv';

%% Leer informacion de tabla

% ------------------------------------------
% carga la informacion
% ------------------------------------------
T = readtable(imputfile);
head(T);
size(T)

table(unique(T.COUNTRY))
italy = T(T.COUNTRY=="Italy",:);
head(italy)
italy = italy(:,3)
head(italy)

%% Figura 1
% --------------------------------------
% Figura de PBI de italia
% gfc significa el objeto que guarda los graficos
clc;
time = 1950:2022;
figure
plot(time, italy.pbipc)

% --------------------------------------
% tasa de crecimiento
growth = (italy.pbipc(2:end) ./ italy.pbipc(1:end-1)-1)*100;
head(growth)
periodo = 1951:2022;

figure
plot(periodo, growth,'r' )
title('Crecimiento economico - Italy');
xlabel('')
ylabel('%')
grid on
saveas(gcf,'Figura1','png')

%% Figura 2 
% Grafico conjunto
% PBI percapita y crecimiento economico
% gfc significa el objeto que guarda los graficos
clc;
figure
tiledlayout(1,2)
nexttile
title('PBI - percapita Italy')
plot(time, italy.pbipc);
xlim([min(time) max(time)]);
grid on
nexttile
title('PBI percapita growth - Italy')
plot(periodo, growth);
xlim([min(periodo) max(periodo)]);
grid on
saveas(gcf,'Figura2','png')

%% Figura 3
% Brecha Producto
% creacion de PBI en log
logpbi = log(italy.pbipc);
[tend, cycle] = hpfilter(logpbi,Smoothing=1600);
cycle = cycle*100;

figure
tiledlayout(1,1)
nexttile
title('PBI growth vs Cycle- Italy')
plot(periodo, growth, 'b', time(2:end), cycle(2:end));
xlim([min(periodo) max(periodo)]);
legend('Crecimiento','Brecha','Location','SW')
grid on 

clc;
figure
tiledlayout(1,1)
nexttile
title('PBI growth vs Cycle- Italy')
plot(periodo, growth, 'b', ... 
    time(2:end), cycle(2:end));
xlim([min(periodo) max(periodo)]);
ylabel('Growth %')
xlabel('')
legend('Growt','Output Gap','Location','SW')
grid on 
saveas(gcf,'Figura3a','png')

clc;
figure
tiledlayout(1,2)
nexttile
title('PBI growth - Italy')
plot(periodo, growth, 'b');
xlim([min(periodo) max(periodo)]);
grid on
nexttile
title('Brecha PBI - Italy')
plot(time, cycle, 'r');
xlim([min(time) max(time)]);
grid on

clc;
figure
tiledlayout(1,2)
nexttile
title('PBI growth - Italy')
plot(time, logpbi, 'b');
xlim([min(time) max(time)]);
grid on
nexttile
title('Brecha PBI - Italy')
plot(time, cycle, 'r');
xlim([min(time) max(time)]);
grid on









