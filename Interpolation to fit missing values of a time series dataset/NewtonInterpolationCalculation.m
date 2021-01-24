function yy = NewtonInterpolationCalculation(x, coeffecients, xx)
              [~,n] = size(coeffecients);
yy = coeffecients(1);
div_x = 1;
for j = 1:n-1
div_x = div_x *(xx-x(j));
yy = (yy + coeffecients(j+1)* div_x);
end