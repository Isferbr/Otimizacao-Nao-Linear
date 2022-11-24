% Condicao de Armijo

function [alphak] = armijo(f,gf,x0)
  % Parametro inicial
  c = 0.0001;
  ro = 0.5;
  alpha = 0.9995;
  xk = x0';
  dk = -gf(xk);
  k = 0;
  while (f(xk+alpha*dk) > f(xk)+c*alpha*gf(xk)'*dk)
    alpha = ro*alpha;
    xk = xk+alpha*dk;
    k = k + 1;
  endwhile
  alphak = alpha;
endfunction