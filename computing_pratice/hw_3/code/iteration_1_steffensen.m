function iteration_1_steffensen(x0, x_leonardo)
%iteration_1_steffensen 迭代法(1) Steffensen加速
fprintf("迭代法(1) Steffensen加速\n");
x = x0;
k = 0;
while abs(x-x_leonardo)>1e-9
    x = (x*iteration_function1(iteration_function1(x))-(iteration_function1(x))^2)/(iteration_function1(iteration_function1(x))-2*iteration_function1(x)+x);
    k = k + 1;
    if k > 10000
        fprintf("不收敛\n");
        break
    end
end
fprintf("k=%d, x=%.9f\n", k, x);
end