close all; clear; clc;

fprintf('Calculating the value of cos(x) using Taylor series: \n\n');
value = input('Enter the value of x to be used in cos(x) : ');
terms = input('Enter the number of terms wanted in Taylor series : ');
cosValue = newCosFunc(value,terms);
fprintf('The value of cos(%0.4f) calculated using Taylor series (upto %d terms) is : %0.4f\n',...
    value,terms,cosValue);

fprintf('\nPlotting the cos(x) functions...\n\n');

thetaValue = [ -2*pi : 0.2 : 2*pi , 2*pi ];

builtinCos = cos(thetaValue);
newCos_n1 = newCosFunc(thetaValue,1);
newCos_n3 = newCosFunc(thetaValue,3);
newCos_n5 = newCosFunc(thetaValue,5);
newCos_n20 = newCosFunc(thetaValue,20);

figure
plot(thetaValue,builtinCos,'--go',thetaValue,newCos_n1,':bs',thetaValue,newCos_n3,'-xr',thetaValue,newCos_n5,'-.*y',thetaValue,newCos_n20,'-.cd');
legend('cos(x) (builtin)','cos(x) (Terms-01)','cos(x) (Terms-03)','cos(x) (Terms-05)','cos(x) (Terms-20)');
title('Cos(x) demonstrated');
xlabel('-2\pi \leq x \leq 2\pi');
ylabel('Cos(x)');

fprintf('\nPlotting Relative Error...\n\n');
testValue = zeros(50);
realError = zeros(49);
for n = 1:50
    testValue(n) = newCosFunc(1.5,n);
    if( n ~= 1)
        realError(n-1) = abs((testValue(n)-testValue(n-1))/testValue(n))*100;
    end
end
figure
plot(realError);
title('Approximate Relative Error calculation');
xlabel('Number of Iterations');
ylabel('Relative Error');