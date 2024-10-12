%------------------------------------------
% Funcion de beneficios
%------------------------------------------
function pi=Profit(q, qj,ci,a,b)
    pi =((a-ci-(b*qj))*q)-(b*(q^2));
return