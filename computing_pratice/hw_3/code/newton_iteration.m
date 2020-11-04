function newton_iteration(x0, x_leonardo)
%NEWTON_ITERATION 此处显示有关此函数的摘要
fprintf("Newton迭代法\n");
x = x0;
k = 0;
while abs(x-x_leonardo)>1e-9
    x = x-(x^3+2*x^2+10*x-20)/(3*x^2+4*x+10);
    k = k + 1;
    if k > 10000
        fprintf("不收敛\n");
        break
    end
end
fprintf("k=%d, x=%.9f\n", k, x);
end

