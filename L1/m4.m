% Funciones
% Caso: Funcion de Utilidad

% ----------------------------
% Question 1a.
% ----------------------------
clc;
clear all;

I= 800;
P = [20,40];
G = [40,20];
lb = [0,0];

[consumption, u , exitflag] = fmincon(@CobbDouglas,...
    G,P,I,[],[], lb)


% ----------------------------
% Question 1b.
% ----------------------------
% vamos a utilizar una funcion no lineal : sqp
clc;
clear all;

I= 800;
P = [20,40];
G = [40,20];
lb = [0,0];

opts = optimset('algorithm','sqp');
[consumption, u , exitflag] = fmincon(@CobbDouglas,...
    G,P,I,[],[], lb,[],[], opts)

