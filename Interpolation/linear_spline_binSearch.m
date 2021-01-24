function yp = linear_spline_binSearch (x, y, val)
  n = length(x);
  if val < x(1) | val > x(n)
    error('range er baire');
  endif
  left = 1; right = n;
  while (1)
    if right - left <= 1 ,break, end
    mid = fix((left + right) / 2);
    if x(mid) < val
      left = mid;
    else
      right = mid;
    end
  end
  yp = y(left) + (y(left + 1) - y(left)) / (x(left + 1) - x(left))*(val - x(left));
endfunction
