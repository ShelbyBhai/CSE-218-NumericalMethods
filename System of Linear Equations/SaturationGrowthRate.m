function [invY, invX] = SaturationGrowthRate(x, y)
  n = size(x)(2);
  invX = zeros(1, n);
  invY = zeros(1, n);
  for i = 1 : n
    invX(i) = 1/x(i);
    invY(i) = 1/y(i);
  endfor
  endfunction