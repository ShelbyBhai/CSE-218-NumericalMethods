X = [8; 2; 11; 6; 5; 4; 12; 9; 6; 1];
Y = [3; 10; 3; 6; 8; 12; 1; 4; 9; 14];
A = polyRegress(@GaussJor, X, Y, 1);
B = polyValue(A, X);
fprintf("y = %.0dx + %.0d\n\n", A(1), A(2));

plot(X, Y, 'o', X, B), hold;