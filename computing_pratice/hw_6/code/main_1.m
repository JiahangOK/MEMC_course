l = 1;
r = 3;
n0 = 10;
h = (r-l)/n0;
sum = 0;

for i=l:h:r-h
    % 每个子区间
    a = i;
    b = i+h;
    n = 4;
    sum = sum + GaussLegendreN4(a,b);
end
fprintf("Gauss-Legendre复合求积结果: %.16f\n", sum);