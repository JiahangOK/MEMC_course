x_p = [0.0, 0.5, 1.0, 6.0, 7.0, 9.0];
y_p = [0.0, 1.6, 2.0, 1.5, 1.5, 0.0];

% 1==== 5次Lagrange插值多项式
x = 0:0.1:9; % 指定x的范围

% 插值基函数
l0 = ((x-x_p(1,2)).*(x-x_p(1,3)).*(x-x_p(1,4)).*(x-x_p(1,5)).*(x-x_p(1,6)))./((x_p(1,1)-x_p(1,2))*(x_p(1,1)-x_p(1,3))*(x_p(1,1)-x_p(1,4))*(x_p(1,1)-x_p(1,5))*(x_p(1,1)-x_p(1,6)));
l1 = ((x-x_p(1,1)).*(x-x_p(1,3)).*(x-x_p(1,4)).*(x-x_p(1,5)).*(x-x_p(1,6)))./((x_p(1,2)-x_p(1,1))*(x_p(1,2)-x_p(1,3))*(x_p(1,2)-x_p(1,4))*(x_p(1,2)-x_p(1,5))*(x_p(1,2)-x_p(1,6)));
l2 = ((x-x_p(1,1)).*(x-x_p(1,2)).*(x-x_p(1,4)).*(x-x_p(1,5)).*(x-x_p(1,6)))./((x_p(1,3)-x_p(1,1))*(x_p(1,3)-x_p(1,2))*(x_p(1,3)-x_p(1,4))*(x_p(1,3)-x_p(1,5))*(x_p(1,3)-x_p(1,6)));
l3 = ((x-x_p(1,1)).*(x-x_p(1,2)).*(x-x_p(1,3)).*(x-x_p(1,5)).*(x-x_p(1,6)))./((x_p(1,4)-x_p(1,1))*(x_p(1,4)-x_p(1,2))*(x_p(1,4)-x_p(1,3))*(x_p(1,4)-x_p(1,5))*(x_p(1,4)-x_p(1,6)));
l4 = ((x-x_p(1,1)).*(x-x_p(1,2)).*(x-x_p(1,3)).*(x-x_p(1,4)).*(x-x_p(1,6)))./((x_p(1,5)-x_p(1,1))*(x_p(1,5)-x_p(1,2))*(x_p(1,5)-x_p(1,3))*(x_p(1,5)-x_p(1,4))*(x_p(1,5)-x_p(1,6)));
l5 = ((x-x_p(1,1)).*(x-x_p(1,2)).*(x-x_p(1,3)).*(x-x_p(1,4)).*(x-x_p(1,5)))./((x_p(1,6)-x_p(1,1))*(x_p(1,6)-x_p(1,2))*(x_p(1,6)-x_p(1,3))*(x_p(1,6)-x_p(1,4))*(x_p(1,6)-x_p(1,5)));

% Lagrange插值多项式
lagrange_x = l0.*y_p(1,1)+l1.*y_p(1,2)+l2.*y_p(1,3)+l3.*y_p(1,4)+l4.*y_p(1,5)+l5.*y_p(1,6);

scatter(x_p, y_p,100, 'markerfacecolor', [ 1, 0, 0 ]);
hold on;
plot(x, lagrange_x, 'b', 'linewidth',1.5);
xlabel('x');
ylabel('y');
hold on;


% 2==== 三次样条插值

% 自然边界条件
M0 = 0;
M5 = 0;

% 子区间长度h
h0 = x_p(1,2) - x_p(1,1);
h1 = x_p(1,3) - x_p(1,2);
h2 = x_p(1,4) - x_p(1,3);
h3 = x_p(1,5) - x_p(1,4);
h4 = x_p(1,6) - x_p(1,5);

miu_1 = h0/(h0+h1);
miu_2 = h1/(h1+h2);
miu_3 = h2/(h2+h3);
miu_4 = h3/(h3+h4);

lambda_1 = 1 - miu_1;
lambda_2 = 1 - miu_2;
lambda_3 = 1 - miu_3;
lambda_4 = 1 - miu_4;

d1 = 6*third_order_mean_difference(x_p, y_p, 1);
d2 = 6*third_order_mean_difference(x_p, y_p, 2);
d3 = 6*third_order_mean_difference(x_p, y_p, 3);
d4 = 6*third_order_mean_difference(x_p, y_p, 4);

% 求解M
A = [2,lambda_1,0,0;miu_2, 2, lambda_2, 0; 0, miu_3, 2, lambda_3; 0, 0, miu_4, 2];
b = [d1 - miu_1*M0; d2; d3; d4 - lambda_4*M5];
m = A\b;
M1 = m(1,1);
M2 = m(2,1);
M3 = m(3,1);
M4 = m(4,1);

% 生成分段函数
s0 = M0.*(x_p(1,2)-x).^3/(6*h0) + M1.*(x-x_p(1,1)).^3/(6*h0) + (y_p(1,1) - M0*h0^2/6).*(x_p(1,2)-x)/h0 + (y_p(1,2) - M1*h0^2/6).*(x-x_p(1,1))/h0;
s1 = M1.*(x_p(1,3)-x).^3/(6*h1) + M2.*(x-x_p(1,2)).^3/(6*h1) + (y_p(1,2) - M1*h1^2/6).*(x_p(1,3)-x)/h1 + (y_p(1,3) - M2*h1^2/6).*(x-x_p(1,2))/h1;
s2 = M2.*(x_p(1,4)-x).^3/(6*h2) + M3.*(x-x_p(1,3)).^3/(6*h2) + (y_p(1,3) - M2*h2^2/6).*(x_p(1,4)-x)/h2 + (y_p(1,4) - M3*h2^2/6).*(x-x_p(1,3))/h2;
s3 = M3.*(x_p(1,5)-x).^3/(6*h3) + M4.*(x-x_p(1,4)).^3/(6*h3) + (y_p(1,4) - M3*h3^2/6).*(x_p(1,5)-x)/h3 + (y_p(1,5) - M4*h3^2/6).*(x-x_p(1,4))/h3;
s4 = M4.*(x_p(1,6)-x).^3/(6*h4) + M5.*(x-x_p(1,5)).^3/(6*h4) + (y_p(1,5) - M4*h4^2/6).*(x_p(1,6)-x)/h4 + (y_p(1,6) - M5*h4^2/6).*(x-x_p(1,5))/h4;

cubic_spline_interpolation_x = zeros(size(x));
for i = 1:length(x)
    if x_p(1)<=x(i) && x(i)<x_p(2)
        cubic_spline_interpolation_x(i) = s0(i);
    elseif x_p(2)<=x(i) && x(i)<x_p(3)
        cubic_spline_interpolation_x(i) = s1(i);
    elseif x_p(3)<=x(i) && x(i)<x_p(4)
        cubic_spline_interpolation_x(i) = s2(i);
    elseif x_p(4)<=x(i) && x(i)<x_p(5)
        cubic_spline_interpolation_x(i) = s3(i); 
    elseif x_p(5)<=x(i) && x(i)<x_p(6)
        cubic_spline_interpolation_x(i) = s4(i); 
    end 
end     
plot(x, cubic_spline_interpolation_x, 'k', 'linewidth',1.5);
legend('原始节点','5次Lagrange插值多项式', '三次样条插值');
