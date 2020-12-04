x_p = [0.0, 0.1, 0.2, 0.3, 0.5, 0.8, 1.0];
y_p = [1.0, 0.41, 0.50, 0.61, 0.91, 2.02, 2.46];

scatter(x_p, y_p, 100, 'k', 'markerfacecolor', 'k');hold on;
xlabel('x');
ylabel('y');
title('曲线拟合','FontSize',16);

x = 0: 0.01: 1.0;

% 3次多项式
n = 3;
A = zeros(n+1,n+1);
for i = 1:n+1
    for j = 1:n+1
        A(i,j) = inner_product(x_p, x_p, i-1, j-1);
    end
end
b = zeros(n+1,1);
for i = 1:n+1
    b(i, 1) = inner_product(x_p, y_p, i-1, 1);
end
a = (A\b)';
s_3 = a(1) + a(2).*x + a(3).*x.^2 + a(4).*x.^3;
plot(x, s_3, 'linewidth',1.5); 

% 4次多项式
n = 4;
A = zeros(n+1,n+1);
for i = 1:n+1
    for j = 1:n+1
        A(i,j) = inner_product(x_p, x_p, i-1, j-1);
    end
end
b = zeros(n+1,1);
for i = 1:n+1
    b(i, 1) = inner_product(x_p, y_p, i-1, 1);
end
a = (A\b)';
s_4 = a(1) + a(2).*x + a(3).*x.^2 + a(4).*x.^3 + a(5).*x.^4;
plot(x, s_4, 'linewidth',1.5); hold on;

% 5次多项式
n = 5;
A = zeros(n+1,n+1);
for i = 1:n+1
    for j = 1:n+1
        A(i,j) = inner_product(x_p, x_p, i-1, j-1);
    end
end
b = zeros(n+1,1);
for i = 1:n+1
    b(i, 1) = inner_product(x_p, y_p, i-1, 1);
end
a = (A\b)';
s_5 = a(1) + a(2).*x + a(3).*x.^2 + a(4).*x.^3 + a(5).*x.^4 + a(6).*x.^5;
plot(x, s_5, 'linewidth',1.5); hold on;




% 指数拟合
n = 1;
A = zeros(n+1,n+1);
for i = 1:n+1
    for j = 1:n+1
        A(i,j) = inner_product(x_p, x_p, i-1, j-1);
    end
end
b = zeros(n+1,1);
for i = 1:n+1
    b(i, 1) = inner_product(x_p, log(y_p), i-1, 1);
end
a = (A\b)';
s_exp = exp(a(1))*exp(a(2).*x);
plot(x, s_exp,'linewidth',1.5); hold on;

legend('原始节点','3次多项式', '4次多项式','5次多项式','指数拟合');