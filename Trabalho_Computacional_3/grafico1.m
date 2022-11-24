% Variáveis ​​de projeto em pontos de malha
x = -5:0.1:5.0;
y = -5.0:0.1:5.0;
[x1, x2] = meshgrid(x,y);
% Problema 1
f1_mesh = 100*(x2-x1^2).^2+(1-x1).^2; % funcao f11
name1 = 'f(x1,x2) = 100*(x2-x1^2)^2+(1-x1)^2';
% Restricao 1
g1_mesh = x1-x2.^2;
g2_mesh = x1.^2-x2;
% Criar um gráfico de contorno
fig = figure();
grid; hold on;
%lines = 0:25:200;
%CS = contour(x1,x2,f9,lines);
%v1 = [0.01,0.5,2.5,10,15,25,35,50,100,200];
%[C, h] = contour(x1,x2,f9,v1);
v2 = 50;
CS = contour(x1,x2,f2_mesh,v2);
C1 = contour(x1,x2,g1_mesh,v2);
C2 = contour(x1,x2,g2_mesh,v2);
%clabel(CS, 'FontSize', 2)
%clabel(C,h);
title(name1)
xlabel('x1')
ylabel('x2')