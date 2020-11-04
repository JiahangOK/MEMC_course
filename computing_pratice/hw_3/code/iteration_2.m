function iteration_2(x0, x_leonardo)
%ITERATION_2 迭代法(2)
fprintf("迭代法(2)\n");
x = x0;
k = 0;
while abs(x-x_leonardo)>1e-9
    x = iteration_function2(x);
    k = k + 1;
    if k > 10000
        fprintf("不收敛\n");
        break
    end
end
fprintf("k=%d, x=%.9f\n", k, x);
end

