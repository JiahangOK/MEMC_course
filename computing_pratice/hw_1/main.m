disp("第(1)问：")
A = [3.01, 6.03, 1.99; 1.27, 4.16, -1.23; 0.987, -4.81, 9.34];
b = [1; 1; 1];
ColumnGussianElimination(A, b);

disp("第(2)问：")
A = [3.00, 6.03, 1.99; 1.27, 4.16, -1.23; 0.990, -4.81, 9.34];
b = [1; 1; 1];
ColumnGussianElimination(A, b);

