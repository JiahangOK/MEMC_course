function output = GaussLegendreN4(a,b)
sum = 0;
x_zero = zeros(1,5);
x_zero(1) = -0.9061798459;
x_zero(2) = 0.9061798459;
x_zero(3) = -0.5384693101;
x_zero(4) = 0.5384693101;
x_zero(5) = 0;
A = zeros(1,5);
A(1) = 0.2369268851;
A(2) = 0.2369268851;
A(3) = 0.4786286705;
A(4) = 0.4786286705;
A(5) = 0.5688888889;

f = @(x)(10/x)^2*sin(10/x);
for i=1:1:5
    sum = sum + A(i)*f((a+b)/2+(b-a)*x_zero(i)/2);
end
output = (b-a)*sum/2;
fprintf("[%.1f,%.1f]Gauss-Legendre求积结果：%.16f\n", a, b, output);
end

