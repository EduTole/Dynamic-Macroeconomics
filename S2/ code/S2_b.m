%==============================================
% Dynamic Macroeconomics 
% Author: Edinson Tolentino
%==============================================
% Ramsey Cass-Koopmans
% SECOND METHODS: programacion dinamica

clc;
clear all;
clear close;

alpha   = 0.35;
k0      = 0.075;
beta    = 0.985;
tol     = 0.00001;
ngrid   = 100;      % Número de puntos en la red que contiene al capital

% steady stacionary
%----------------------------------
ks      = (alpha*beta)^(1/(1-alpha));

% Numerical solutions
% red contiene capital: intervalo
grid(1)=0.0 ;
for i=2:ngrid
    grid(i)=grid(i-1)+ks/(ngrid-2);
end
k=grid;

% Inicializacion
%-----------------------------------------------
k1(1)=1;
for i=2:ngrid
    k1(i)=k(i-1)+1; % Función de política
end
k2=zeros(ngrid,1);

v0=zeros(ngrid,1); % Función de valor
for i=1:ngrid
    v0(i)=log(k(i)^alpha-0); % Valor inicial para la función de valor
end
v1=zeros(ngrid,1); % Funciones de valor adicionales
v2=v0;
dv=1;       % Divergencia entre dos iteraciones continuas
t=1;        % Variable que usamos para contar el número de iteraciones

% Iteracion
% forma 2
for t=1:1000
    for i=1:ngrid
        for j=1:ngrid
            v2(j)=log(k(i)^alpha-k(j))+beta*v0(j);
        end

        v1(i)=max(v2);
        k2(i)=maxloc(v2,1); % Función auxiliar que replica el comando maxloc en Fortran

    end
    dv=max(max(abs(v1-v0)));
    if (dv<tol)
        break;
    else
    v0=v1;
    k1=k2;
    t=t+1;
    end
    disp(t)
    disp(dv)
end

%time = (0:1:500-1); %% time index
figure(1);
plot(k','r-');
ylabel('Capital Stock');
xlabel('Time');

figure(2)
plot(grid',v1,'r',grid',v2,'b-')
xlabel('capital stock, k')
ylabel('policy function, g(k)')
legend('policy 1','Policy 2','location','SouthEast')

figure(3)
plot(k',v1,'r',k',v2,'b-')
xlabel('capital stock, k')
ylabel('policy function, g(k)')
legend('policy 1','Policy 2','location','SouthEast')


% Functions: maxloc 
%----------------------------------
function out=maxloc(x,dim)

if nargin<2, dim=0; end

xdim=length(size(x));

if dim==0
    [dumvar,tempOut]=max(x(:));
    out=cell(1,xdim);
    [out{:}]=ind2sub(size(x),tempOut);
    %out=[out{:}];
else

    if ~isnumeric(dim), error('dim must be anumber in maxloc'); end

    if dim~=round(dim), error('dim must be an integer in maxloc'); end

    if dim>xdim || dim<1, error('dim must be 0<dim<=length(size(x))'); end
    [dumvar,out]=max(x,[],dim);
end

end
