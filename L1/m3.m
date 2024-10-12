%% Importar datos en formato CSV - I
clc;
clear all;

% Paso 1: Definimos la ruta de tu archivo
filename = 'BD1.csv';  % Colocamos el nombre de tu archivo

% Paso 2: Leer CSV file en matrix
data = readmatrix(filename);

% Paso 3: Mostrar data importada
disp(data);

%% Importar datos en formato CSV - II

clc;
clear all;

% ------------------------------------------
% Paso 1: 
% ------------------------------------------
% Definimos la ruta de tu archivo
filename = 'BD1.csv';  % Colocamos el nombre de tu archivo

% ------------------------------------------
% Paso 2: 
% ------------------------------------------
% definimos opciones de la importacion
opts = detectImportOptions(filename);
opts.VariableNamesLine = 1;

% ------------------------------------------
% Paso 3: 
% ------------------------------------------
% definimos opciones de string variables
data = readtable(filename, opts);
disp(data)

% Paso 4: 
% Diseno de filas y columnas
size(data)

%% Filtro de Datos
% tabla de paises 
table(unique(data.COUNTRY))

% Filtro de paises = austria
austria = data(data.COUNTRY=="Austria",:);
austria

% Condiciones de filtro de informacion de paises 
gruponame = ["Austria","Belgium","Cyprus"];

% filtrar paiises
filtracion = ismember(data.COUNTRY, gruponame);

% crear la nueva data
datafiltrada = data(filtracion, :);
size(datafiltrada)
datafiltrada

%% Estadisticas descriptivas

tabla1 = grpstats(datafiltrada, ...
    "COUNTRY",["mean","min","max"],"DataVars",["pbipc"]);
tabla1



