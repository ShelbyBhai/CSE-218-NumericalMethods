function [output] = newCosFunc(val,term_num)

syms x;

f(x) = taylor(cos(x),'Order',(2*term_num - 1));

output = double(f(val));