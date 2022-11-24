clear,clc
% Dados do problema
%f = @(x)2*x(1)^2+2*x(1)*x(2)+x(2)^2-2*x(2);
%h1 = @(x)x(1);
%x0 = [1,1];
f = @(x)x^3;
h1 = @(x)x + 1;
x0 = 1;
% ---------------------
% Parametros iniciais
epsilon = 0.001;
c0 = 6;
tau = 0.9995;
beta = 1.05;
lambda = -3;
nmax = 100;
% ---------------------
xk = x0
ck = c0
lambdak = lambda
L = f(xk) + lambdak*h1(xk)
k = 0;
vk = +inf;
while(vk >= epsilon && k < nmax)
  xk = L
  lambdak = lambdak + ck*h1(xk)
  vk = max(abs(h1(xk)))
  if(vk > tau*vk)
    ck = beta*ck
  endif
  k = k+1
endwhile
xmin = xk