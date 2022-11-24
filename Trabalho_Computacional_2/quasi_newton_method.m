% Metodo Quasi-Newton (Método de Davidon_Fletcher-Powell - DFP)
% =========================================================
% ENTRADA
% =========================================================
% f -> funcao objetivo
% df -> vetor gradiente
% H -> matriz hessiana no ponto x0
% x0 -> ponto inicial
% tol -> tolerancia de convergência
% nmax -> numero maximo de iteracoes
% ========================================================
% SAIDA
% ========================================================
% k -> numero de iteracoes
% xmin -> minimo da funcao encontrado
% fval -> valor da funcao aplicada ao ponto xmin
% ========================================================
function [k,xmin,fval,hist] = quasi_newton_method(f,df,H,x0,tol,nmax)
  xk = x0';
  H_old = H;
  g = df(xk)';
  hist = [];
  for i = 1:nmax
    hist = [hist;xk];
    dk = -inv(H_old)*g;
    if (norm(dk) < tol)
      break;
    endif
    alphak = aurea(f,df,x0,[0 1],tol);
    %alphak = armijo(f,df,x0);
    x_new = xk + alphak*dk;
    g_new = df(x_new)';
    yk = g_new - g;
    sk = x_new - xk;
    B_old = inv(H_old);
    B_new = B_old + (sk*sk')/(yk'*sk) - (B_old*yk*yk'*B_old)/(yk'*B_old*yk);
    H_new = inv(B_new);
    H_old = H_new;
    xk = x_new;
    g = g_new;
  endfor
  hist = [hist;xk];
  k = i;
  xmin = x_new';
  fval = f(xmin);
endfunction




