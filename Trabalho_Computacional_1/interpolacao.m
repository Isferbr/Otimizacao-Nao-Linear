% ALGORITIMO DE OTIMIZACAO BASEADO NO METODO DE INTERPOLACAO

function alphak = interpolacao(f,g, alpha0, n)
%--------------- DADOS DE ENTRADA -----------------------
% f = funcao objetivo, dado como fcn1, fcn2, fcn2, ... , fcn10 
% g = derivada da funcao objetivo dado como dfcn1, dfcn2, ... , dfcn10
% a = limite inferior do intervalo inicial de incerteza
% b = limite superior do intervalo inicial de incerteza
% n = número de iteracoes
% Sintaxe para f: fcn1 = @(x)(x(1)-2)^4+(x(1)-2*x(2))^2;
% Exemplo: interpolacao(fcn1,dfcn1,10,100)
%------------------ DADOS DE SAIDA -----------------------
% valor de alpha_k

%------------------------- INICIO ------------------------
x0 = [0 0];
g0 = g(x0);
d0 = -g0;
dd = g0*d0';
c1 = 0.001;
cfa = @(a)f(x0+a*d0)<=f(x0)+c1*a*dd;
getab = @(a0,a1)1/(a0^2*a1^2*(a1-a0))*[a0^2 -a1^2; -a0^3 a1^3]*[f(x0+a0*d0)-f(x0)-dd*a1; f(x0+a0*d0)-f(x0)-dd*a0];
  
if cfa(alpha0)
  alphak = alpha0;
  return;
endif
alpha1 = -(dd*alpha0^2)/(2*(f(x0+alpha0*d0)-f(x0)-dd*alpha0));
if cfa(alpha1)
  alphak = alpha1;
  return;
endif
[a b] = getab(alpha0, alpha1);
alpha2 = (-b+sqrt(b^2-3*a*dd))/3*a;
i = 0;
while !cfa(alpha2) && i < n  
  [a b] = getab(alpha1, alpha2);
  alpla1 = alpha2;
  alpha2 = (-b+sqrt(b^2-3*a*dd))/3*a;
end
alphak = alpha2;
if i == n
  fprintf('Estorou o limite de iterações\n');
 endif
endfunction