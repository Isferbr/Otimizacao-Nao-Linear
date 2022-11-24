% Método de Barreira ou Pontos Interiores (Logaritmica)
% Primal min c'x
%        s.a Ax = b'

% lema (Farkas Algébrico)
% Ax <= 0 e c'x > 0
% A'y = c e y >= 0
function [] = metodo_barreira()
  %psi = sum(ln(-g(i));
  % ********** INICIALIZAÇAO **********
  [m n] = size(A);
  x = A'*inv(A*A')*b;
  E2 = 100;
  E1 = min([max(x),E2,norm(b,1)/(E2*norm(A,1))]);
  E3 = 1+norm(c,1);
  % Determinacao dos pontos iniciais
  x = max(x,E1); % valor inicial de x
  y = zeros(m,1); % valor inicial de y
  z = c; % valor provisorio de z
  % ***** Atribuicao de valores para z inicial *****
  % para z >= 0
  sub = find(z >= 0);
  z(sub,1) = z(sub,1)+E3;
  % para z <= 0
  aux = min(z,0);
  sub = find(aux <= -E3); % z <= -E3
  aux(sub,1) = -z (sub,1);
  sub = find(aux > -E3); % z >= -E3
  aux(sub,1) = E3;
  z = max(aux,z); % valor inicial de z
  clear aux; clear sub;
  % ********** FIM: INICIALIZAÇAO **********
  % * Definiçao de parametros *
  NF = 1; % criterio de parada
  k = 0; % contador de iteraçoes
  e= ones(n,1);
  while NF > epsi,
    if k==1000 % Evita loop Eterno
      fprintf(1,' \n');
      fprintf(1,'Número máximo de iterações: %d \n',k);
      fprintf(1,' \n');
      break
    end
      gama = trace(diag(x)*diag(z));
    if gama < 1
      mi = gama^2/n;
  else
      mi = sigma * gama/n;
  end
  %sigma = 1;
  %p = b-A*x;
  %c = [c; M];
  %A = [A p];
  %x = [x; sigma];
  % Inicializacao de variaveis
  k = 0;
endfunction