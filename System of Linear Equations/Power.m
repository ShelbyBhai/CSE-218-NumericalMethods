function [logx, logy] = Power(x, y)
  n = size(x)(2);
  logx = zeros(1, n);
  logy = zeros(1, n);
  for i = 1 : n
    logx(i) = log10(x(i));
    logy(i) = log10(y(i));
  endfor
endfunction
