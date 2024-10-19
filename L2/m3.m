%% Informacion de ruta de carpeta
clc;
clear all;
close all;

% ------------------------------------------
% informacion del archivo
% ------------------------------------------
imputfile = 'Trimestral-20241018-102946.xlsx';

% ------------------------------------------
% carga la informacion
% ------------------------------------------
T = readtable(imputfile, 'sheet','Trimestrales','ReadRowNames',true);
head(T);
%table(unique(T.Var1))

% Generacion de la fecha
%---------------------------------------
time = datetime(1999,01,31):calmonths(3):datetime(2024,01,31);

head(time)
size(time)

%period = quarter(time);
%size(period);
%head(period)

% tasa de crecimiento
pbi = T.pbi;
size(pbi)
head(pbi)

q = 4;
growth = nan(length(pbi)- q,1);
for i = (q+1):length(pbi)
    growth(i-q) = (pbi(i)-pbi(i-q))/ pbi(i-q) * 100;
end

head(growth)
size(growth)
size(time(5:end))

clc;
figure
plot(time(5:end) , growth, 'b');
ylabel('tasa de crecimiento %')
xlabel('')
legend('% PBI', 'Location','SW')
grid on
    
clc;
figure
plot(time(5:end) , growth, 'b');
ylabel('tasa de crecimiento %')
xlabel('')
legend('% PBI', 'Location','SW')
xtickformat("MMM-yyyy")
xlim([min(time) max(time)])
grid on


%% Analisis de variables prociclicas

consumo = T.Consumo;
size(consumo)
head(consumo)

q = 4;
growthcons = nan(length(consumo)- q,1);
for i = (q+1):length(consumo)
    growthcons(i-q) = (consumo(i)-consumo(i-q))/ consumo(i-q) * 100;
end

clc;
figure
plot(time(5:end) , growth, 'b',...
    time(5:end) , growthcons, 'r');
ylabel('tasa de crecimiento %')
xlabel('')
legend('PBI','Consumo', 'Location','SW')
xtickformat("MMM-yyyy")
xlim([min(time) max(time)])
grid on
saveas(gcf,'Figura6','png')

%% Tasa de crecimiento del consumo publico

consumop = T.consumopu;
size(consumop)
head(consumop)

q = 4;
growthconsp = nan(length(consumop)- q,1);
for i = (q+1):length(consumop)
    growthconsp(i-q) = (consumop(i)-consumop(i-q))/ consumop(i-q) * 100;
end

clc;
figure
plot(time(5:end) , growth, 'b',...
    time(5:end) , growthconsp, 'r');
ylabel('tasa de crecimiento %')
xlabel('')
legend('PBI','Gasto', 'Location','SW')
xtickformat("MMM-yyyy")
xlim([min(time) max(time)])
grid on
saveas(gcf,'Figura7','png')


