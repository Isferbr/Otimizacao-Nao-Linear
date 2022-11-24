% Exemplo Numérico
f = @(x)x(1)^2+2*x(2)^2;
g = @(x)x(1)+x(2)-1/2;
% Metodo de Barreira (Logaritmica)
b = @(x)-log(-g(x));
r = @(x,t)f(x)+t*b(x);
gr = @(x)[2*x(1)+t*(gb/g), 4*x(2)+t*(gb)
x0 = [-2,1];