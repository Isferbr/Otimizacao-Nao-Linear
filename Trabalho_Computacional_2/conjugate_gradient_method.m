% Metodo do Gradiente Conjugado (Método de Fletcher-Reeves)
% =========================================================
% ENTRADA
% =========================================================
% f -> funcao objetivo
% df -> vetor gradiente
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
function [k,xmin,fval,hist] = conjugate_gradient_method(f,df,x0,tol,nmax)
  xk = x0';
  dk = df(xk);
  n = size(xk,1);
  k = 0;
  hist = [];
  while (norm(dk) > tol && k < nmax)
    hist = [hist;xk];
    dk = -df(xk)';
    for i = 0:n-1
      alphak = aurea(f,df,x0,[0 0.2],tol);
      %alphak = armijo(f,df,x0);
      xk = xk + alphak*dk;
      if (i < n-1)
        betak = (dk'*dk)/(dk'*dk);
        dk = -dk + betak*dk;
      endif
    endfor
    k = k + 1;
    x0 = xk';
    dk = df(x0);
  endwhile
  hist = [hist;xk];
  if (k > nmax)
    fprintf('O metodo parou sem convergir!\n');
  endif
  xmin = x0;
  fval = feval(f,xmin);
endfunction