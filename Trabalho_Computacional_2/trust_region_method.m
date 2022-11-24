% Metodo da Regiao de Confianca
% =========================================================
% ENTRADA
% =========================================================
% f -> funcao objetivo
% df -> vetor gradiente
% delta0 -> valor do raio da bola
% x0 -> ponto inicial
% tol -> tolerancia de convergência
% nmax -> numero maximo de iteracoes
% ========================================================
% SAIDA
% ========================================================
% k -> numero de iteracoes
% xmin -> minimo da funcao encontrado
% fval -> valor da funcao aplicada ao ponto xmin
% rhok -> tamanho da redução do raio
% ========================================================
function [k,xmin,fval,hist,rhok] = trust_region_method1(f,df,x0,H,delta0,eta,tol,nmax)
  xk = x0';
  deltak = delta0;
  dk = df(xk);
  k = 0;
  hist = [];
  while (norm(dk) > tol && k < nmax)
    hist = [hist;xk];
    f(xk);
    dk = df(xk)';
    pk = dogleg(f,df,xk,H,deltak);
    mkp = dk'*pk + 0.5*pk'*H*pk;
    rhok = -(f(xk)-f(xk+pk))/mkp;
    if (rhok < 1/4)
      deltak = norm(pk)/4;
    elseif (rhok > 3/4 && norm(pk) == deltak);
      deltak = min(2*deltak,delta0);
    endif
    if (rhok > eta)
      xk = xk + pk;
      H = DFP(df,xk,xk-pk,H);
    endif
    k = k + 1;
  endwhile
  hist = [hist;xk];
  if (k > nmax)
    fprintf('O metodo parou sem convergir!\n');
  endif
  xmin = xk;
  fval = f(xmin);
endfunction