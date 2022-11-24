% Metodo de Newton
% ==========================================================
% ENTRADA
% ==========================================================
% f -> funcao objetivo
% df -> vetor gradiente de f
% H -> matriz hessiana de f no ponto x0
% x0 -> ponto inicial
% tol -> tolerancia de convergência
% nmax -> numero maximo de iteracoes
% ==========================================================
% SAIDA
% ==========================================================
% k -> numero de iteracoes
% xmin -> minimo da funcao encontrado
% fval -> valor da funcao aplicada ao ponto xmin
% hist -> armazena o valor do x em k iteracoes
% ==========================================================
function [xk,xmin,fval] = newton_method(f,gf,H,x0,tol,nmax)
  xk = x0;
  dk = gf(xk);
  k = 0;
  %hist = [];
  while (norm(dk) >= tol && k < nmax)
    %hist = [hist;xk];
    dk = -inv(H)*gf(xk)';
    %dk = -inv(H(xk))*gf(xk)';
    alphak = armijo(f,gf,x0);
    xk = xk + alphak*dk';
    %xk = xk + dk';
    k = k + 1;
  endwhile
  %hist = [hist;xk];
  if (k > nmax)
    fprintf('O metodo parou sem convergir!\n');
  endif
  xmin = xk;
  fval = feval(f,xmin);
endfunction