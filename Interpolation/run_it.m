x = [1 3 6 8 10];
y = [2 14 5 2 5];

xp = [x(1) : .1 : x(length(x))]; 
hold on;
plot(x, y, 'o');
for i = 1 : length(xp)
  yp(i) = linear_spline_binSearch(x, y, xp(i));
endfor
plot(xp, yp);
b = newtonInterpolation(x, y);
yp = make_func_interpolation(xp, x, b);
%Lagrange : yp = lagrangeInterpolation(length(x) - 1, x, y, xp);
plot(xp, yp);