% ALGORITIMO DE OTIMIZACAO BASEADO NO METODO DE FIBONACCI - 1D
clc
clear all
close all

n=8; %numero de iteracoes
a=0; %limite inferior de busca
b=1; %limite superior de busca

fobj = @(x1,x2)((x2 - 2)^4 + (x1 - 2*x2)^2); %funcao objetivo

N=n+1;
fold=1;
fnew=1;
for i=1:N
    if i==1 || i==2
    f(i)=1;
    continue;
    end
    f(i)=fold+fnew;
    fold=fnew;
    fnew=f(i);
end
L2=(b-a)*f(N-2)/f(N);
j=2;
while j<N
L1=(b-a);
if L2>L1/2
    anew=b-L2;
    bnew=a+L2;
else if L2<=L1/2
        anew=a+L2;
        bnew=b-L2;
    end
end
k1=fobj(anew);
k2=fobj(bnew);
if k2>k1
    b=bnew;
    L2=f(N-j)*L1/f(N-j+2);
else if k2<k1
        a=anew;
        L2=f(N-j)*L1/f(N-(j-2));
    else if k2==k1
            b=bnew;
            L2=f(N-j)*[b-a]/f(N-(j-2));
            j=j+1;
        end
    end
end
j=j+1;
end
fprintf('\n O intervalo final de incerteza e = [%f - %f]\n', a,b);