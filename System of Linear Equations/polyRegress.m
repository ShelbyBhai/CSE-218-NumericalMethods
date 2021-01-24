function output = polyRegress(func, X, Y, degree)
degree=degree+1;
A = zeros(degree);
B = zeros(degree, 1);
for i = 1:degree
    for i2 = 1:degree
        temp = X.^(i+i2-2);
        s = sum(temp);
        A(i, i2) = s;
    end
    temp2 = X.^(i-1);
    temp3 = temp2.*Y;
    s2 = sum(temp3);
    B(i) = s2;
end
res = func(A, B);
output = res;
        
    
