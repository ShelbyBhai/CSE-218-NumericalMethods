function yy = Spline_Linear(x, y, xx)

n = max(size(x))-1;

figure
for i = 1 : n
    linear = @(xIn) (y(i) + ((y(i + 1)-y(i))/(x(i + 1)-x(i))) * (xIn - x(i)));
    fplot(linear,[x(i),x(i+1)]);
    hold on
end

xlabel('Time (in months)');
ylabel('Total shampoo sold');
title('The Linear Spline')

grid on;

yy = zeros(size(xx));
m = max(size(xx));

for j = 1 : m
    for i = 1 : n
        if xx(j) >= x(i) && xx(j) <= x(i+1)
            line = @(xIn) (y(i) + ((y(i + 1)-y(i))/(x(i + 1)-x(i))) * (xIn - x(i)));
            yy(j) = line(xx(j));
            scatter(xx(j),yy(j),30,'b','filled');
            hold on
        end
    end
end

