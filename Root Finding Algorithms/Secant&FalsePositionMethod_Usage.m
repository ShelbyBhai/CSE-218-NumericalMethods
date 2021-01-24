close all; clear; clc;

p = [0:0.01:1];
q = ex2_f(p);
line = zeros(101);
line = line(1,:);

figure
plot(p,q,p,line);
[rootFP, nIterFP] = falsePositionMethod(@ex2_f,-1.5,0.5,0.5,10);
%falsePositionMethod(f,-1.5,0.5,0.5,100)
[rootSM, nIterSM] = secantMethod(@ex2_f,-1.5,0.5,0.5,100);
%secantMethod(f,-1.5,0.5,0.5,100)