function [y] = newton_nonlinear_iteration(x0)
%NEWTON_NONLINEAR_ITERATION 此处显示有关此函数的摘要
%   此处显示详细说明
F_x = zeros(3,1);
F_x_1 = zeros(3,3);
x1 = x0(1,1);
x2 = x0(2,1);
x3 = x0(3,1);
F_x(1,1) = 3*x1-cos(x2*x3)-1/2;
F_x(2,1) = x1^2-81*(x2+0.1)^2+sin(x3)+1.06;
F_x(3,1) = exp(-x1*x2)+20*x3+(10*pi-3)/3;

F_x_1(1,1) = 3;
F_x_1(2,1) = 2*x1;
F_x_1(3,1) = x2*exp(-x1*x2);
F_x_1(1,2) = x3*sin(x2*x3);
F_x_1(2,2) = -162*(x2+0.1);
F_x_1(3,2) = x1*exp(-x1*x2);
F_x_1(1,3) = x2*sin(x2*x3);
F_x_1(2,3) = cos(x3);
F_x_1(3,3) = 20;

delta_x = F_x_1\(-F_x);
y = x0 + delta_x;
end

