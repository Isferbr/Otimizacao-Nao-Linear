% Variáveis ​​de projeto em pontos de malha
x = -5:0.1:5.0;
y = -5.0:0.1:5.0;
[x1, x2] = meshgrid(x,y);
% Funcao 1
f1_mesh = (x1-2).^4+(x1-2*x2).^2;
name1 = 'f(x1,x2) = (x1-2)^4+(x1-2*x2)^2';
% Funcao 2
f2_mesh = 100*(x2-x1.^2).^2+(1-x1).^2;
name2 = 'f(x1,x2) = 100*(x2-x1^2)^2+(1-x1)^2';
% Funcao 7
f7_mesh = 0.1*(12+x1.^2+(1+x2.^2)./x1.^2+(x1.^2 .*x2.^2+100)./(x1.^4 .*x2.^4));
name7 = 'f(x1,x2) = 0.1*(12+x1^2+(1+x2^2)/x1^2+(x1^2*x2^2+100)/(x1^4*x2^4))';
% Funcao 8
f8_mesh = (x1.^2+x2.^2+x1.*x2).^2+sin(x1).^2+cos(x2).^2;
name8 = 'f(x1,x2) = (x1^2+x2^2+x1*x2)^2+sin(x1)^2+cos(x2)^2';
% Funcao 9
f9_mesh = 1.41*x1.^4-12.76*x1.^3+39.91*x1.^2-51.93*x1+24.37+(x2-3.9).^2;
name9 = 'f(x1,x2) = 1.41*x1^4-12.76*x1^3+39.91*x1^2-51.93*x1+24.37+(x2-3.9)^2';
% Criar um gráfico de contorno
fig = figure();
grid; hold on;
%lines = 0:25:200;
%CS = contour(x1,x2,f9,lines);
%v1 = [0.01,0.5,2.5,10,15,25,35,50,100,200];
%[C, h] = contour(x1,x2,f9,v1);
v2 = 50;
CS = contour(x1,x2,f2_mesh,v2);
%clabel(CS, 'FontSize', 2)
%clabel(C,h);
title(name2)
xlabel('x1')
ylabel('x2')
% Gradient Method
%tic
% Exemplo: [k, xmin, fval, hist] = gradient_method(f,df,x0,tol,nmax)
%[k, xmin, fval, hist] = gradient_method(f1,df1,f1x1,10e-4,1000);
%toc
% Newton Method
%tic
% Exemplo: [k, xmin, fval, hist] = newton_method(f,df,H,x0,tol,nmax);
%[k, xmin, fval, hist] = newton_method(f1,df1,H1,f1x1,10e-4,1000);
%toc
% Quasi-Newton Method
%tic
% Exemplo: [k, xmin, fval, hist] = quasi_newton_method(f,df,H,x0,tol,nmax);
%[k,xmin,fval,hist] = quasi_newton_method(f1,df1,H1,f1x1,10e-4,1000);
%toc
% Conjugate Gradient Method (Método de Fletcher-Reeves)
%tic
% Exemplo: [k, xmin, fval, hist] = conjugate_gradient_method(f,df,x0,tol,nmax);
%[k,xmin,fval,hist] = conjugate_gradient_method(f1,df1,f1x1,10e-4,1000);
%tic
% Conjugate Gradient Method (Método de Polak-Ribière)
%tic
% Exemplo: [k, xmin, fval, hist] = conjugate_gradient_method1(f,df,x0,tol,nmax);
[k,xmin,fval,hist] = conjugate_gradient_method1(f2,df2,f2x1,10e-4,1000);
%tic
% Trust Region Method
%tic
% Exemplo: [k, xmin, fval, hist] = trust_region_method(f,df,x0,H,delta0,eta,tol,nmax);
%[k,xmin,fval,hist,rhok] = trust_region_method(f1,df1,f1x1,H1,1,0.1250,10e-4,1000);
%toc
% Grafico das k iteracoes de x
%plot(hist(:,1), hist(:,2), 'm-d',...
%    'LineWidth', 1.5,...
%    'MarkerEdgeColor', 'b',...
%    'MarkerEdgeColor', 'b');
% Grafico das k iteracoes de x
%pkg load geometry;
%drawCircle(hist(1,:),hist(2,:),rhok);  
plot(hist(1,:), hist(2,:), 'm-d',...
    'LineWidth', 1.5,...
    'MarkerEdgeColor', 'b',...
    'MarkerEdgeColor', 'b');

% Salva a figura como PNG
%saveas(fig,'contour','png')