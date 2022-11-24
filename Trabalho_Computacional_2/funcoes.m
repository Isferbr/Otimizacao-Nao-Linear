clear,clc

% Funcao 1
f1 = @(x)(x(1)-2)^4+(x(1)-2*x(2))^2;
df1 = @(x)[2*(2*(x(1)-2)^3+x(1)-2*x(2)) 8*x(2)-4*x(1)]; % vetor gradiente
H = @(x)[12*(x(1)-2)^2+2 -4; -4 8];
H1 = [50 -4; -4 8]; % valor da hessiana no ponto x1
H2 = [110 -4; -4 8]; % valor da hessiana no ponto x2
f1x1 = [0 3]; 
f1x2 = [-1 -1];
% Funcao 2
f2 = @(x)100*((x(2)-x(1)^2)^2)+(1-x(1))^2;
df2 = @(x)[2*(200*x(1)^3-200*x(1)*x(2)+x(1)-1) 200*(x(2)-x(1)^2)];
H3 = [3534 760; 760 200]; % valor da hessiana no ponto x1
H4 = [1330 -480; -480 200]; % valor da hessiana no ponto x2
f2x1 = [-1.9 2];
f2x2 = [1.2 1];
% Funcao 7
f7 = @(x)0.1*(12+x(1)^2+(1+x(2)^2)/x(1)^2+(x(1)^2*x(2)^2+100)/(x(1)^4*x(2)^4));
df7 = @(x)[(0.2*x(1)^6*x(2)^4+x(1)^2*(-0.2*x(2)^6-0.2*x(2)^4-0.2*x(2)^2)-40)/x(1)^5*x(2)^4 (x(1)^2*(0.2*x(2)^6-0.2*x(2)^2)-40)/(x(1)^4*x(2)^5)];
H5 = [204850.6000 163864; 163864 204839.2000]; % valor da hessiana no ponto x1
H6 = [0.2783 -0.0412; -0.0412 0.0264]; % valor da hessiana no ponto x2
f7x1 = [0.5 0.5];
f7x2 = [3 3];
% Funcao 8
f8 = @(x)(x(1)^2+x(2)^2+x(1)*x(2))^2+sin(x(1))^2+cos(x(2))^2;
df8 = @(x)[2*(2*x(1)+x(2))*(x(1)^2+x(1)*x(2)+x(2)^2)+2*sin(x(1))*cos(x(1)) 2*(x(1)+2*x(2))*(x(1)^2+x(1)*x(2)+x(2)^2)-2*sin(x(2))*cos(x(2))];
H7 = [113.5803 57.6600; 57.6600 55.7599];% valor da hessiana no ponto x1
H8 = [22.6927 0; 0 25.3073]; % valor da hessiana no ponto x2
f8x1 = [3 0.1];
f8x2 = [2 -2];
% Funcao 9
f9 = @(x)1.41*x(1)^4-12.76*x(1)^3+39.91*x(1)^2-51.93*x(1)+24.37+(x(2)-3.9)^2;
df9 = @(x)[5.64*x(1)^3-38.28*x(1)^2+79.82*x(1)-51.93 2*(x(2)-3.9)];
H9 = [79.8200 0; 0 2]; % valor da hessiana no ponto x1
H10 = [120.0200 0; 0 2]; % valor da hessiana no ponto x2
f9x1 = [0 0];
f9x2 = [5 5];

% https://comnuan.com/cmnn04/cmnn04004/cmnn04004.php
