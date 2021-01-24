function [root, n_iter] = secantMethod(func, xl, xu, es, maxIter)

if(xl>xu)
    temp=xl;
    xl=xu;
    xu=temp;
end

n_iter = 0;
ea = 1.1*es+.01;
xr0 = xl;

while (n_iter< maxIter && ea>es)
    n_iter = n_iter + 1;
    xr = xu - ((func(xu)*(xl - xu))/(func(xl)-func(xu)));
    ea = abs((xr-xr0)/xr)*100;
    xr0=xr;
    xl=xu;
    xu=xr;
        if(abs(xr-xu)<es)
        root=xr;
        end
end
fprintf('\nsecant method\n\n');
fprintf('Estimated Root = %0.4f\n', root);
fprintf('Function(Root) = %0.4f\n', func(root));
fprintf('Approximate error = %0.4f\n', ea);
fprintf('Number of iterations = %d\n', n_iter);