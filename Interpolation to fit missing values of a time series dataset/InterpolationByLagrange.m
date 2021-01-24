function yy = InterpolationByLagrange(x,y,xx)
n = max(length(y));
yy = 0;
diffOf_xx_and_x = (xx - x);
for i = 1 : n
        tempVar = prod(diffOf_xx_and_x) .* y(i) ./ diffOf_xx_and_x(i);
for j = 1 : n
if i ~= j
tempVar = tempVar ./ (x(i) - x(j));
end
        end
yy = yy + tempVar;
end