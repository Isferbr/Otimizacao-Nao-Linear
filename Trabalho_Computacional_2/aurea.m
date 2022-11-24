% Metodo da Razao Aurea
% =======================================
% ENTRADA
% =======================================
% f -> funcao objetivo
% df -> vetor gradiente
% x0 -> ponto inicial
% I -> Intervalo de incerteza [a b]
% tol -> tolerancia de convergência
% ======================================
% SAIDA
% ======================================
% alphak -> tamanho de passo
% ======================================
function [alphak] = aurea(f,df,x0,I,tol)
  k = 0;
  a = I(1); b = I(2);
  r = (sqrt(5)-1)/2;
  alfa = a+(1-r)*(b-a);
  beta = a+r*(b-a);
  g = -feval(df,x0);
  y1 = feval(f,x0+alfa*g);
  y2 = feval(f,x0+beta*g);
  while (b-a)>tol
    k = k + 1;
    if y1 > y2
      a = alfa; alfa = beta; y1 = y2;
      beta = a+r*(b-a);
      y2 = feval(f,x0+beta*g);
    else
      b = beta; beta = alfa; y2 = y1;
      alfa = a+(1-r)*(b-a);
      y1 = feval(f,x0+alfa*g);
    endif
  endwhile
  alfa = (b+a)/2;
  alphak = alfa;
endfunction