function b = newtonInterpolation (x, y)
  %this function returns b1, b2, b3,..... of the (n-1)th degree polynomial
  n = length(x);
  mat = zeros(n);
  for i = 2 : n
    mat(i, i-1) = (y(i) - y(i-1)) / (x(i) - x(i-1));
  endfor
  
  for i = 2 : n-1
    for j = i+1 : n
      mat(j,j-i) = (mat(j, j-i+1) - mat(j-1,j-i)) / (x(j) - x(j-i));
    endfor
  endfor
  
  b(1) = y(1);
  for i = 2 : n
    b(i) = mat(i, 1);
  endfor

endfunction
