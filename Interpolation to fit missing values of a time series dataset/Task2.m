clc;

shampoo_values = csvread("shampoo.csv",1,0);

%-------- filtering missing values -------------
rows_InValid = [];
rows_Valid = [];
length_of_shampoo_values = size(shampoo_values);
for i = 1 : length_of_shampoo_values(1)
if (shampoo_values(i,2) ~= 0)
rows_Valid = [rows_Valid i];
else
rows_InValid = [rows_InValid i];
end
        end

shampoo_values_notfound = rows_InValid;
shampoo_values_found = shampoo_values(rows_Valid, :);

figure
        scatter(shampoo_values_found(:,1),shampoo_values_found(:,2),70,'b','filled');
xlabel('Time (in months)');
ylabel('Total shampoo sold');
title('The Data of Shampoo Set')
grid on;

%----- interpolation -----
[~,n] = size(shampoo_values_notfound);

newton_coeffs = InterpolationByNewton(shampoo_values_found(:,1)',shampoo_values_found(:,2)');
newtonShampooVals = zeros(n,2);
for i = 1 : n
        newtonShampooVals(i,1) = shampoo_values_notfound(i);
newtonShampooVals(i,2) = NewtonInterpolationCalculation(shampoo_values_found(:,1)', newton_coeffs, shampoo_values_notfound(i));
end

xDataInPlot = linspace(min(shampoo_values_found(:,1)),max(shampoo_values_found(:,1)),100);

yDataInPlot = zeros(size(xDataInPlot));

for i = 1 : 100
yDataInPlot(i) = NewtonInterpolationCalculation(shampoo_values_found(:,1)', newton_coeffs, xDataInPlot(i));
end
        figure
plot(xDataInPlot,yDataInPlot);
hold on
xlabel('Time (in months)');
ylabel('Total shampoo sold');
title('The Newton Polynomial Interpolation');
grid on;
scatter(newtonShampooVals(:,1),newtonShampooVals(:,2),40,'o','filled');

lagrangeShampooVals = zeros(n,2);
for i = 1 : n
        lagrangeShampooVals(i,1) = shampoo_values_notfound(i);
lagrangeShampooVals(i,2) = InterpolationByLagrange(shampoo_values_found(:,1)', shampoo_values_found(:,2)', shampoo_values_notfound(i));
end
        yDataInPlot = zeros(size(xDataInPlot));
for i = 1 : 100
yDataInPlot(i) = InterpolationByLagrange(shampoo_values_found(:,1)', newton_coeffs, xDataInPlot(i));
end
        figure
plot(xDataInPlot,yDataInPlot);
hold on
xlabel('Time (in months)');
ylabel('Total shampoo sold');
title('The Lagrange Polynomial Interpolation');
grid on;
scatter(lagrangeShampooVals(:,1),lagrangeShampooVals(:,2),40,'g','filled');

quadraticSpline_of_shampoovals = Spline_Quadratic(shampoo_values_found(:,1)', shampoo_values_found(:,2)', shampoo_values_notfound);
linearSpline_of_shampoovals = Spline_Linear(shampoo_values_found(:,1)', shampoo_values_found(:,2)', shampoo_values_notfound);

