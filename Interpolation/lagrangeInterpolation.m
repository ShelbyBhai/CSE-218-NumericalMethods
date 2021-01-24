function yp = lagrangeInterpolation (n, x, y, xp)
  for i = 1 : length(xp)
    yp(i) = 0;
  endfor
  for i = 1 : n+1
    m = 1;
    for j = 1 : n+1
      if j ~= i
        m = m .* ((xp - x(j)) ./ (x(i) - x(j)));
      endif 
    endfor
    yp = yp + m .* y(i);  
  endfor
endfunction
