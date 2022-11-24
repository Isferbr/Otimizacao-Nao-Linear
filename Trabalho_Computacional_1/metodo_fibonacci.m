% ALGORITIMO DE OTIMIZACAO BASEADO NO METODO DE FIBONACCI

function metodo_fibonacci(f,a,b,n)
%--------------- DADOS DE ENTRADA -----------------------
% f = funcao objetivo, dado como fcn1, fcn2, fcn2, ... , fcn10
% a = limite inferior do intervalo inicial de incerteza
% b = limite superior do intervalo inicial de incerteza
% n = número de iteracoes
% Sintaxe para f: fcn1 = @(x)(x(1)-2)^4+(x(1)-2*x(2))^2;
% Exemplo: metodo_fibonacci(f,[0 0],[1 1],100)
%------------------ DADOS DE SAIDA -----------------------
% a = limite inferior do intervalo de incerteza final
% b = limite superior do intervalo de incerteza final
% minimizante x^*
% minimo Min

%------------------------- INICIO ------------------------
%clearvars -global
F = zeros(1,n);
F(1) = 1;
F(2) = 2;
for j = 3:(n+1)
  F(j) = F(j-1)+F(j-2);
end
k = 1;
lambda = 1-(F(n-k+1))/(F(n-k+2));
a1 = a+lambda*(b-a);
b1 = b-lambda*(b-a);
fprintf('----------------------------------------------------\n');
fprintf( 'k     a1     b1    f(a1)    f(b1)    Novo intervalo\n');
fprintf('----------------------------------------------------\n');
k =2;
while (k <=n && a1<b1)
  output1 = a1;
  output2 = b1;
  output3 = f(a1);
  output4 = f(b1);
if (f(a1)<f(b1))
  b = b1;
  b1 = a1;
  lambda = 1-(F(n-k+1))/(F(n-k+2));
  a1 = a+lambda*(b-a);
elseif (f(a1)>f(b1))
  a = a1;
  a1 = b1;
  lambda = 1-(F(n-k+1))/(F(n-k+2));
  b1 = b-lambda*(b-a);
end
output5 = a;
output6 = b;
fprintf('%.2d\t [%.2f %.2f]\t [%.2f %.2f]\t %.2f\t %.2f\t', k-1, output1(1), output1(2), output2(1), output2(2), output3, output4);
fprintf('( [%.2f %.2f]\t [%.2f %.2f] )\n', output5, output6);
k = k+1;
end
if (k-1 == n)
  teta = (b-a)/4;
  k = n;
  lambda = 1-(F(n-k+1))/(F(n-k+2));
  a1 = a + lambda*(b-a);
  b1 = a1+teta;
  if (f(a1)>f(b1))
    a = a1;
  elseif (f(a1)<f(b1))
    b = a1;
  end
elseif (a1 > b1)
  a = b1;
  b = a1;
end
fprintf('%2d\t [%.2f %.2f]\t [%.2f %.2f]\t %.6f\t %.6f\t',k, a1, b1, f(a1), f(b1));
fprintf('\n');
fprintf('O intervalo de incerteza final é ');
fprintf('( [%.2f %.2f]\t [%.2f %.2f] )\n', a, b);
fprintf('Uma aproximação para o minimizante é x^*=[%.2f %.2f]\n',(a+b)./2);
fprintf('Uma aproximação para o mínimo é f(x^*)= %.6f\n',f((a+b)./2));
endfunction

  
  