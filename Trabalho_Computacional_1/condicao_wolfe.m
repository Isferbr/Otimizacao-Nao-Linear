% ALGORITIMO DE OTIMIZACAO BASEADO NA CONDICAO DE WOLFE

function alphak = condicao_wolfe(f,g, xk,alpha0, n)
%--------------- DADOS DE ENTRADA -----------------------
% f = funcao objetivo, dado como fcn1, fcn2, fcn2, ... , fcn10 
% g = derivada da funcao objetivo dado como dfcn1, dfcn2, ... , dfcn10
% xk = vetor inicial dado, exemplo fcn1x1 = [0 3] e fcn1x2 = [-1 -1]
% n = número de iteracoes 
% Sintaxe para f: fcn1 = @(x)(x(1)-2)^4+(x(1)-2*x(2))^2;
% Exemplo: condicao_wolfe(fcn1,dfcn1,fcn1x1,100)
%------------------ DADOS DE SAIDA -----------------------
% valor de alpha_k

%------------------------- INICIO ------------------------
  p = 0.9;
  c = 0.0001;
  alpha = alpha0;
  d = -g(xk);
  i = 0;
  while i < n && f(xk + alpha*d) > f(xk) + c*alpha*g(xk)'*d
    alpha = alpha*p;
    i = i +1;
  endwhile
  alphak = alpha; 
  if i == n
    fprintf('Estorou o limite de iterações\n');
  endif
endfunction

  
  