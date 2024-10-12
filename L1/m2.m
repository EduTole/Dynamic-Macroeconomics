%% Informacion de ruta de carpeta
clc;
clear all;
close all;

%% Usando informacion de los files
% ------------------------------------------
% informacion del archivo
% ------------------------------------------
imputfile = 'BD1.xlsx';

%% Leer informacion de tabla

% ------------------------------------------
% carga la informacion
% ------------------------------------------
T = readtable(imputfile)
size(T)
head(T)
tail(T)

% ------------------------------------------
% informacion de nombres unicos
% ------------------------------------------
table(unique(T.COUNTRY))

% ------------------------------------------
%realizar los filtros
% ------------------------------------------
austria = T(T.COUNTRY=="Austria",:);
austria

time = 1950:2022;
time

% Figura iniciales
figure ('Name','PBI-cap Austria')
plot(time,austria.pbipc)


figure ('Name','PBI-cap Austria')
plot(time,austria.pbipc)
xlim([min(time) max(time)])


figure ('Name','PBI-cap Austria')
plot(time,austria.pbipc)
xlim([min(time) max(time)])
ylim([min(austria.pbipc) max(austria.pbipc)])