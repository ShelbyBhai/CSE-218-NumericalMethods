function ans = Linearization(func, x, y)
  [linearx, lineary] = func(x, y);
  A = polyRegress(@GaussJor, linearx, lineary, 1);
  B = polyValue(A, linearx);
  plot(linearx, B);
  
  if(func==@Exponential)
    beta = A(2);
    alpha = power(exp(1),A(1));
  endif
  if(func==@Power)
    beta = A(2);
    alpha = power(10, A(1));
  endif
  if(func==@SaturationGrowthRate)
    alpha = 1/A(1);
    beta = alpha*A(2);
  endif
  endfunction