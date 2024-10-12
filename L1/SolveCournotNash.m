function Nash=SolveCournotNash(a,b,ci,cj)

% ---------------------------------------
% insumos : 
% ---------------------------------------
%           ci : CM for i
%           cj : CM for j
%           a  : intercepto
%           b  : pendiente
% ---------------------------------------
% Producto : Nash, cantidad de equilibrio
% ---------------------------------------
opts =  optimset('Algorithm','sqp',...
    'Display','off');
Nash =  fmincon(@(q) Cournotprofit(q,a,b,ci,...
    cj),[0,0],[],[],[],[],[0,0],...
    [],[],opts);

return