B = @(x)(log(-g1(x))+log(g2(x)));
r = @(x)f(x)-(1/ck)*B(x); % problema irrestrito
gr = @(x)gf(x)-(1/ck)*((dg1(x)/g1(x))+(dg2(x)/g2(x))); % gradiente do problema irrestrito