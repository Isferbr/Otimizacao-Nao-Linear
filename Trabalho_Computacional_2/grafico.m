%clc;
%clear all;
%close all;

function grafico(f,name)
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
  end;
  mesh(x1, x2, z);
  title(['Gráfico da Função 1']);
  xlabel('x1');
  ylabel('x2');
  zlabel('f(x1,x2)');
  grid on;
endfunction