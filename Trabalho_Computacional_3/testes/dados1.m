clear,clc
% tau = 0.995
% eplison = 10e-06
% Metodo de Barreira ou Pontos Interiores
% Primal min c'x
%        s.a Ax = b'
% Metodo de Barreira Logaritmica
% 01 - Problema
f11 = @(x)100*(x(2)-x(1)^2)^2+(1-x(1))^2; % funcao 11
gf11 = @(x)[-400*x(1)*(-x(1)^2+x(2))+2*x(1)-2, -200*x(1)^2+200*x(2)]; % vetor gradiente de f11
f11g1 = @(x)x(1)-x(2)^2; % restricao 1
f11dg1 = @(x)[1, -2*x(2)]; % vetor gradiente de g1
f11g2 = @(x)x(1)^2-x(2); % restricao 2
f11dg2 = @(x)[2*x(1), -1]; % vetor gradiente de g2
f11x0 = [-2,1]; % ponto inicial
H11 = @(x)[2*(600*x(1)^2-200*x(2)+1),-400*x(1); -400*x(1), 200]; % hessiana de f11
%H0 = [4402 800; 800 200];
% Metodo de Penalidade e Lagrangeana Aumentada
% 01 - Problema
f21 = @(x)(x(1)-1)^2+(x(2)-x(1)^2)^2; % funcao 21
gf21 = @(x)[-4*x(1)*(-X(1)^2+X(2))+0.02*x(1)-0.02, -2*x(1)^2+2*x(2)]; % vetor gradiente de f21
f21dg1 = @(x)[1, 2*x(3)]; % vetor gradiente de g1
f21x0 = [2,2,2]; % ponto inicial
H21 = @(x)[12*x(1)^2-4*x(2)+0.02,-4*x(1);-4*x(1),2]; % hessiana de f21
% 02 - Problema
f22 = @(x)(x(1)-x(2))^2+(x(2)+x(3)-2)^2+(x(4)-1)^2+(x(5)-1)^2; % funcao 22
gf22 = @(x)[2*x(1)-2*x(2); -2*x(1)+4*x(2)+2*x(3)-4; 2*x(2)+2*x(3)-4; 2*x(4)-2;2*x(5)-2]; % vetor gradiente de f22
f22h{1} = @(x)x(1)+3*x(2)-4; % restricao 1
f22h{2} = @(x)x(3)+x(4)-2*x(5); % restricao 2
f22h{3} = @(x)x(2)-x(5); % restricao 3
