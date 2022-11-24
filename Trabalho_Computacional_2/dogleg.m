% Metodo Dogleg
% =========================================================
% ENTRADA
% =========================================================
% f -> funcao objetivo
% df -> vetor gradiente
% H -> matriz hessiana de f no ponto x0
% x0 -> ponto inicial
% delta0 -> valor do raio da bola
% ========================================================
% SAIDA
% ========================================================
% pk -> 
% ========================================================
function [pk] = dogleg(f,df,x0,H,delta)
  xk = x0';
  dk = df(xk)';
  curv = dk'*H*dk;
  if curv <= 0
    pk = -delta*dk/norm(dk);
  else
    pc = -(dk'*dk/curv)*dk;
    if (norm(pc) >= delta);	
      pk = -delta*dk/norm(dk);
    else
      if det(H) <= 0
        pk = pc;
      else
        pN = -inv(H)*dk;
        if norm(pN) <= delta
          pk = pN;
        else
          pnc = pN - pc;
          a = norm(pnc)^2;
          b = 2*pc'*pnc;
          c = norm(pc)^2-delta^2;
          lambda = (-b+sqrt(b^2-4*a*c))/2*a;
          pk = pc + lambda*pnc;
        endif
      endif
    endif
  endif
endfunction