function yp = make_func_interpolation (xp, x, b)
  n = length(b);
  l = length(xp);
  s = 0;
  for i = 1 : l
    yp(i) = 0;
  endfor
  for i = 1 : n
    m = 1;
    for j = 1 : i-1 
      m = m .* (xp - x(j));
    endfor
    yp = yp + m .* b(i);
  endfor
  
endfunction
