function yy = Spline_Quadratic(x, y, xx)

n = max(size(x))-1;

b = zeros(3*n,1);
A = zeros(3*n);


A(1,1) = 1;
A(2,1:3) = [x(1)^2 x(1) 1];
A(3,1:3) = [x(2)^2 x(2) 1];
b(2:3) = y(1:2);

y_index = 3;
x_index = 2;
for i = 4 : 3 : 3*n
        A(i,i-3:i-2) = [2*x(x_index) 1];
A(i,i:i+1) = [-2*x(x_index) -1];
A(i+1,i:i+2) = [x(x_index)^2 x(x_index) 1];
A(i+2,i:i+2) = [x(x_index+1)^2 x(x_index+1) 1];
b(i+1:i+2) = y(y_index-1:y_index);
x_index = x_index + 1;
y_index = y_index + 1;
end

coeffecients = A\b;

figure
for i=1:n
        curvature=@(xIn) coeffecients((3*i-2))*xIn.^2+coeffecients((3*i-1))*xIn+coeffecients((3*i));
fplot(curvature,[x(i),x(i+1)]);
hold on
end
title('The Quadratic Spline')
xlabel('Time (in months)');
ylabel('Total shampoo sold');
grid on;

m = max(size(xx));
yy = zeros(size(xx));
for j = 1 : m
for i = 1 : n
if xx(j) >= x(i) && xx(j) <= x(i+1)
curvature=@(xIn) coeffecients((3*i-2))*xIn.^2+coeffecients((3*i-1))*xIn+coeffecients((3*i));
yy(j) = curvature(xx(j));
scatter(xx(j),yy(j),30,'p','filled');
hold on
end
        end
end

