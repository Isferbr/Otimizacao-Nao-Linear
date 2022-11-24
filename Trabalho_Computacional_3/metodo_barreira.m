%clear,clc

function [k, xmin, fval] = metodo_barreira(f,gf,g1,dg1,g2,dg2,x0,tol,nmax)
  % ---------------------
  % Parametros iniciais
  beta = 1.995;
  u0 = 0.01;
  % ---------------------
  xk = x0;
  uk = u0;
  B = @(x)(log(-g1(x))+log(g2(x)));
  r = @(x)f(x)-uk*B(x); % problema irrestrito
  gr = @(x)gf(x)-(1/uk)*((dg1(x)/g1(x))+(dg2(x)/g2(x))); % gradiente do problema irrestrito
  dk = -gr(xk);
  %gr = @(x,u)[-log(-x(1)+x(2)^2)-log(x(1)^2-x(2), -u*((2*x(1)/(x(1)^2-x(2))-(1/(-x(1)+x(2)^2)))-400*x(1)*(x(1)^2+x(2))+x2*x(1)-2, -u*(2*x(2)/(-x(1)+x(2)^2)-(1/(x(1)^2-x(2))))-200*x(1)^2+200*x(2)];
  %Hr = @(x)[0, -2*x(1)/(x(1)^2-x(2))+1/(-x(1)+x(2)^2), -2*x(2)/(-x(1)+x(2)^2)+1/(x(1)^2-x(2)); 
  k = 0;
  while(uk*r(xk) > tol && k < nmax)
    xk = f(xk+;
    alphak = armijo(r,gr,x0);
    uk = uk+alphak*dk;
    k = k + 1;
  endwhile
  xmin = xk
  fval = f(xk)
endfunction