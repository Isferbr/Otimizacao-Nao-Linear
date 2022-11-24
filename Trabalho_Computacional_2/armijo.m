function [alpha] = armijo(f,df,x0)
  xk = x0;
  beta = 0.5;
  rho = 0.2;
  n = 1;
  nmax = 100;
  while (n < nmax)
    gk = df(xk);
    dk = -gk;
    xk = xk + (beta^n)*dk;
    if (f(xk) <= f(xk)+rho*(beta^n)*gk*dk')
      alpha = beta^n;
      return;
    endif
    xk = xk;
    n = n + 1;
  endwhile
  alpha = beta^n;
  disp('alpha');
endfunction 
  