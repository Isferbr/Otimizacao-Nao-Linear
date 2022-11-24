% Metodo da Maxima Descida
% =========================================================
% ENTRADA
% =========================================================
% f -> funcao objetivo
% df -> vetor gradiente
% H -> matriz hessiana de f no ponto x0
% x0 -> ponto inicial
% tol -> tolerancia de convergência
% nmax -> numero maximo de iteracoes
% ========================================================
% SAIDA
% ========================================================
% k -> numero de iteracoes
% xmin -> minimo da funcao encontrado
% fval -> valor da funcao aplicada ao ponto minimo
% hist -> armazena o valor do x em k iteracoes
% ========================================================
function [k,xmin,fval,hist] = gradient_method(f,df,x0,tol,nmax)
  xk = x0;
  dk = df(xk);
  k = 0;
  hist = [];
  while (norm(dk) > tol && k < nmax)
    hist = [hist;xk];
    norm(dk);
    dk = -df(xk);
    alphak = aurea(f,df,x0,[-10 10],tol);
    %alphak = armijo(f,df,x0);
    xk = xk + alphak*dk;
    k = k + 1;
  endwhile
  hist = [hist;xk];
  if (k > nmax)
    fprintf('O metodo parou sem convergir!\n');
  endif
  xmin = xk;
  fval = feval(f,xmin);
endfunction