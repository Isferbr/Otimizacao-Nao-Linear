
function [xk] = metodo(f,df,H0,x0)
  x = x0;
  H = H0;
  gradiente = df(x)';
  hessiana = H(x);
  % Inicia o valor de alfa
  alfa = 0.9995;
  % Define a Matriz A
  A = [1 -1; 1 -1];
  % Define vetor b
  b = [0; 0];
  % Define o valor da tolerancia episolon
  episolon = 0.1;
  Xk = zeros(length(x),length(x));
  % inicializa o vetor de e = [1 1 1 1 ... 1]
  e = ones(1,length(x));
  nmax = 100;
  k = 0;
  xk = x0;
  while(norm(k < nmax))
    for i=1:length(xk)
      Xk(i,i) = xk(i);
    endfor
    % Calculo do vetor estimativa dual
    Hk = inv((hessiana+inv(Xk)*inv(Xk)));
    wk = inv(A*Hk*transpose(A))*A*Hk*(gradiente);
    % Calculo do vetor custo relativo
    sk = gradiente- transpose(A)*wk;
    episolon3 = 0.001;
    % Teste de Otimalidade
    if length(xk(xk>0)) == length(x)
      if length(sk(sk>0)) == length(sk)
        if transpose(xk)*sk < episolon3
          display('Solução Otima Encontrada')
          break
        endif
      endif
    endif
    % Calculo de Direcao de Translacao
    dxk = -Hk*sk;
    % Teste de Ilimitariedade
    if length(dxk(dxk>0)) == length(dxk)
      display('Problema Ilimitado')
      condicao_de_parada = 1;
    endif
    % Teste de Otimalidade dxk
    if length(dxk(dxk<=episolon3)) == length(dxk)
      display('Solucao Otima Encontrada')
      break
        % Teste de Factibilidade
        episolon1 = 0.001;
        episolon2 = 0.1;
    endif
    % Calculo do Comprimento do Passo
    alfak2 = -transpose(dxk)*(gradiente)/((transpose(dxk)*hessiana*dxk));
    alfak1 = min(-alfa*xk(dxk<0)./dxk(dxk<0));
    alfak = alfa*min(alfak1,alfak2);
    if length(alfak1) == 0
      alfak = alfak2;
    endif
    % Nova Solucao
    xk = xk+alfak*dxk;
    gradiente = df(x)';
    hessiana = H(x);
    k = k+1;  
  endwhile
endfunction