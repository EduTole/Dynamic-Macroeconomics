%==============================================
% Dynamic Macroeconomics 
% Author: Edinson Tolentino
%==============================================
% Ramsey Cass-Koopmans
% FIRST METHODS

clc;
clear all;
clear close;

% parameters 
% -------------------------------------------------

alpha   = 0.35;
k0      = 0.075;
beta    = 0.985;
tol     = 0.00001;
T       = 30;

% steady stacionary
%----------------------------------
ks      = (alpha*beta)^(1/(1-alpha));
x0      = ones(T,1)*0.8*ks;
param   = [alpha k0 beta ks];

% iteration 
%-----------------------------------
sol     = secant('sys', x0, param);

time = (0:1:T-1); %% time index

figure(1)
plot(time, sol,'r-')
ylabel('Capital Stock')
xlabel('Time')
name = [fig_path '\capital_time' ];
print('-depsc', name)

% Functions
%-----------------------------------
function x = secant(sys, x0, param)
    
    del = diag(max(abs(x0)*1e-4,1e-8));
    n   = length(x0);
    for i=1:1000
        f=feval(sys,x0, param);
        for j=1:n
            J(:,j)=(f-feval(sys,x0-del(:,j),param))/del(j,j);
        end
        x = x0-inv(J)*f';
        if norm(x-x0)<0.00001
            break;
        end
        x0 = x;
    end
end

function f=sys(z,p)

    a = p(1);
    b = p(2);
    c = p(3);
    d = p(4);

    f(1)=((((z(1)^a)-z(2))/((b^a)-z(1))))-a*c*(z(1)^(a-1));

    for i=2:30-1
    f(i)=((((z(i)^a)-z(i+1))/((z(i-1)^a)-z(i))))-a*c*(z(i)^(a-1));
    end
    
    i = 30;
    f(i)=((((z(i)^a)-d)/((z(i-1)^a)-z(i))))-a*c*(z(i)^(a-1));
end

