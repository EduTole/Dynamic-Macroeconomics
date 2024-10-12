%------------------------------------------
% Funcion de mejor respuesta
%------------------------------------------
function qi = BestResponse(qj, ci, a, b)
    options = optimset('Algorithm','sqp','Display','off');
    qi = fmincon(@(q) -Profit(q, qj,ci,a,b),...
        0,[],[],[],[],0,[],[],options);

return 