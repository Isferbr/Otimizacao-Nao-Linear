function H = DFP(df,x_new,x0,H)
  B_old = H;
  g = df(x0)';
  g_new = df(x_new)';
  sk = x_new - x0;
  yk = g_new - g;
  B_new = B_old + (sk*sk')/(yk'*sk) - (B_old*yk*yk'*B_old)/(yk'*B_old*yk);
endfunction
  