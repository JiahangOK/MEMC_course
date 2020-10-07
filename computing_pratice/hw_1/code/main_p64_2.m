disp("====(1)====")
A = [3.01, 6.03, 1.99; 1.27, 4.16, -1.23; 0.987, -4.81, 9.34];
b = [1; 1; 1];
% 输出A, b, detA
disp('A=');
disp(A);
disp('b=');
disp(b);
disp('detA=');
disp(det(A));
% 列主元消去
x=ColumnGussianElimination(A, b);
% 输出解向量
disp("x=");
disp(x);
% 输出条件数
disp("cond 1 A=");
disp(cond(A,1));
disp("cond 2 A=");
disp(cond(A,2));
disp("cond inf  A=");
disp(cond(A,inf));

disp("====(2)====")
A = [3.00, 6.03, 1.99; 1.27, 4.16, -1.23; 0.990, -4.81, 9.34];
b = [1; 1; 1];
% 输出A, b, detA
disp('A=');
disp(A);
disp('b=');
disp(b);
disp('detA=');
disp(det(A));
% 列主元消去
x=ColumnGussianElimination(A, b);
% 输出解向量
disp("x=");
disp(x);

