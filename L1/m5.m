clc;
clear all;

% -------(1) 
a  = 20;
c  = 2;
b  = 1;
qj = [0:20]';

% ---------(2)
qi_star=NaN(size(qj));

for count = 1:size(qj,1)
    qi_star(count,1) = BestResponse(qj(count,...
        1),c,a,b);
end
 
line(qj, qi_star,'LineWidth',2, 'Color',[1,0,0])
ylabel('q_i','FontSize',12)
xlabel('q_j','FontSize',12)

% ----------(3) Generamos la grilla para qi
qi= [0:20]';

% ----------(4)
qi_star=NaN(size(qj));

for count = 1:size(qj,1)
    qj_star(count,1) = BestResponse(qi(count,...
        1),c,a,b);
end

hold on
line(qj_star, qi,'LineWidth',2, 'Color',[0,0,1])

