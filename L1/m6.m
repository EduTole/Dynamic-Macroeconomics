% Caso de modelod e cournot
%------------------------------------------
a  = 20;
ci  = 2;
cj  = 2;
b  = 1;
qi = [0:20]';
qj = [0:20]';

Nash = SolveCournotNash(a, b, cj, ci)
