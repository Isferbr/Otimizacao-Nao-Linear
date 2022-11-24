% clear,clc
% ---------------------
% Escolha mi0 > 0, tau > 0 e x0
% Se Gradiente de Q(xk,mi) < tau, pareto
% Escolha um novo parametro mik+1 > mik
% Escolha um novo xk+1
% k = k +1

function [xmin, fval] = metodo_penalidade(f,g,x0)
  % ---------------------
  % Parametros iniciais
  epsilon = 0.001;
  c0 = 0.1;
  nmax = 100;
  % ---------------------
  xk = x0;
  ck = c0;
  lambda = 0.01;
  P = @(x,mi)f(x)+mi*(g{1}(x)+g{2}(x)+g{3}(x));
  %P = @(x,lambda)f(x)+lambda*(h{1}(x)+h{2}(x)+h{3}(x));
  k = 0;
  while(ck*P(xk,lambda) >= epsilon && k < nmax)
    xk = f(xk)+ck*P(xk,lambda)
    alphak = armijo(f,gf,x0)
    ck = alphak*ck
    k = k + 1
  endwhile
  xmin = xk
  fval = feval(f,min)
endfunction