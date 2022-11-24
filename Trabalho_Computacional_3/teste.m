clear, clc
pkg load optim;
% Primeiro problema
f11 = @(x)100*(x(2)-x(1)^2)^2+(1-x(1))^2;
function [c1, c2] = nlcon(x)
  c1 = x(1)-x(2)^2;
  c2 = x(1)^2-x(2);
endfunction
A11 = [1, -1; 1, -1];
b11 = [0, 0,]';
Aeq = [];
beq = [];
lb = [];
ub = [];
x0 = [-2,1];
nonlcon = @nlcon;
options = optimset('Display','iter','Algorithm','interior-point');
[x, fval] = fmincon(f11,x0,A11,b11)
% -----------------------------------------------------------------
% Segundo probema
f12 = @(x)x(1)^2+0.5*x(2)^2+x(3)^2+0.5*x(4)^2-x(1)*x(3)+x(3)*x(4)-x(1)-3*x(2)+x(3)-x(4);
A12 = [5, -1, -2, -1, -1; 4, -3, -1, -2, 1; 0, 1, 4, -1.5];
b12 = [0, 0, 0]';
x0 = [0.5, 0.5, 0.5, 0.5];
nonlcon = @nlcon;
options = optimset('Display','iter','Algorithm','interior-point');
[x, fval] = fmincon(f12,x0,A12,b12)
% -----------------------------------------------------------------
% Quarto problema
f21 = @(x)0.01*(x(1)-1)^2+(x(2)-x(1)^2)^2;
function [ceq] = nlcon(x)
  x(1)+x(3)^2+1;
endfunction
A = [];
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
x0 = [2, 2, 2];
nonlcon = @nlcon
options = optimset('Display','iter','Algorithm','interior-point');
[x, fval] = fmincon(f21,x0,A,b,Aeq,beq,lb,ub,nonlcon,options)
% ------------------------------------------------------------------
% Quinto problema
f22 = @(x)(x(1)-x(2))^2+(x(2)+x(3)-2)^2+(x(4)-1)^2+(x(5)-1)^2;
A22 = [1, 3, -4, 0, 0;0, 0, 1, 1, -2; 0, 1, 0, 0, -1];
b22 = [0, 0, 0]';
Aeq = [];
beq = [];
lb = [];
ub = [];
x0 = [2.5, 0.5, 2, -1, 0.5];
options = optimset('Display','iter','Algorithm','interior-point');
[xmin, fval, exitflag, output] = fmincon(f22,x0,A22,b22)
% Sexto problema
f23 = @(x)(x(1)-2)^2+(x(2)-1)^2;
function [c, ceq] = nlcon(x)
  c = 0.25*x(1)^2+x(2)^2-1;
  ceq = x(1)-2*x(2)+1;
endfunction
A = [];
b = [];
Aeq = [];
beq = [];
lb = [];
ub = [];
x0 = [2, 2];
nonlcon = @nlcon
%options = optimset('Display','Iter','Algorithm','interior-point');
[x, fval] = fmincon(f23,x0,A,b,Aeq,beq,lb,ub,nonlcon)
