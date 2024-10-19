%% Informacion de ruta de carpeta
clc;
clear all;
close all;

% ------------------------------------------
% informacion del archivo
% ------------------------------------------
imputfile = 'Anuales-20241018-165546.xlsx';

% ------------------------------------------
% carga la informacion
% ------------------------------------------
T = readtable(imputfile, 'sheet','Anuales','ReadRowNames',true);
head(T);

% Analisis de breca producto y PBI
logpbi = log(T.Y);
logC = log(T.Cprivado);

[tend, cycle] = hpfilter(logpbi,Smoothing=1600);
cycle = cycle*100;
periodo = 1979:2023;

clc;
figure
yyaxis right 
plot(periodo,logpbi, ':r',LineWidth=2);
ylabel('Log - values')
yyaxis left
plot(periodo, logC, 'b', LineWidth=2);
ylabel('Log - values')
xlim([min(periodo) max(periodo)])
legend('PBI','Consumo','Location','NW')
grid on 
saveas(gcf,'Figura3b','png')

clc;
figure
yyaxis right 
plot(periodo,logpbi, ':r',LineWidth=2);
ylabel('Log - values')
yyaxis left
plot(periodo, cycle, 'b', LineWidth=2);
ylabel('Values - %')
xlim([min(periodo) max(periodo)])
legend('Brecha Producto','PBI','Location','NW')
grid on 
saveas(gcf,'Figura3c','png')




