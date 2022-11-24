%clc;
%clear all;
%close all;

function grafico(f, g1, g2, g3)
  %% Dados para o uso da Função Teste (x* = [0; 0])
  %name = '1';
  x0 = [-2; 2];
  Q = [2 0; 0 10];
  c = [0; 0];
  a1 = a2 = -4;
  b1 = b2 = 4;

  tol = 0.001;
  nmax = 100;
  tam = 100;
  x1 = linspace(a1, b1, tam);
  x2 = linspace(a2, b2, tam);
  z = zeros(tam);
  for i = 1 : tam
	  z(i, :) = f([x1(i) * ones(1, tam); x2]);
  endfor
  w = zeros(tam);
  for j = 1 : tam
    w(j, :) = g1([x1(j) * ones(1, tam); x2]);
  endfor
  y = zeros(tam);
  for k = 1 : tam
    y(k, :) = g2([x1(k) * ones(1, tam); x2]);
  endfor
  x = zeros(tam);
  for l = 1 : tam
    x(l, :) = g3([x1(l) * ones(1, tam); x2]);
  endfor
  hold on;
  f = mesh(x1, x2, z);
  g1 = mesh(x1, x2, w);
  g2 = mesh(x1, x2, y);
  g3 = mesh(x1, x2, x);
  title(['Gráfico do Problema 1']);
  xlabel('x1');
  ylabel('x2');
  zlabel('f(x1,x2)');
  grid on;
endfunction