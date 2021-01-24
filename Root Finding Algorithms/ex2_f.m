function [val] = ex2_f(x)
val = (x ./ (1-x) .* sqrt(6 ./(2+x))) - 0.05;