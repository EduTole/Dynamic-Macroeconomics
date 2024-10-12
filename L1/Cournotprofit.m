function Beneficio=Cournotprofit(q, a, b, ci, cj)

% Retorno de la funcion de beneficios
% Insumos : 
%           q: [q(1); q(2)]
%           ci: CM para i
%           cj: CM para j
%           a : intercepto
%           b : pendiente
% --------------------------------------------
qi_star = BestResponse(q(2), ci,a,b);
qj_star = BestResponse(q(1), cj,a,b);

% --------------------------------------------
% Producto: Beneficio de las dos empresas
% --------------------------------------------

Beneficio = (q(1)-qi_star)^2+(q(2)-qj_star)^2;

return