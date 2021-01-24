function coeffecients = InterpolationByNewton(x,y)
n = size(y);
n = n(2);
div_def = zeros(n, n-1);
div_def = [y' div_def];
for i = 2 : n
for j = i : n
        div_def(j,i) = (div_def(j,i-1) - div_def(j-1,i-1)) / (x(j) - x(j-i+1));
end
        end

coeffecients = zeros(1,n);
for i = 1:n
        coeffecients(i) = div_def(i,i);
end
