function [ansx, lny] = Exponential(x, y)
  n = size(x)(2);
  ansx = zeros(1, n);
  lny = zeros(1, n);
  for i = 1 : n
    lny(i) = log(y(i));
  endfor
  ansx = x;
  endfunction