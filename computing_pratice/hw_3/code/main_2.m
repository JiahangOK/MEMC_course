x = [0, 0, 0];

fprintf("不动点迭代法(x2开根取正):\n");
% 不动点迭代法不动点迭代法(x2开根取正)
k = 1;
for k=1:10
    x1 = x(1,1);
    x2 = x(1,2);
    x3 = x(1,3);
    x(1,1) = (cos(x2*x3)+0.5)/3;
    x(1,2) = sqrt(x1^2+sin(x3)+1.06)/9-0.1;
    x(1,3) = ((3-pi*10)/3-exp(-x1*x2))/20;
    fprintf("k=%d, x=[%f,%f,%f]\n", k, x(1,1), x(1,2), x(1,3));
end

fprintf("不动点迭代法(x2开根取负):\n");
% 不动点迭代法(x2开根取负)
k = 1;
for k=1:10
    x1 = x(1,1);
    x2 = x(1,2);
    x3 = x(1,3);
    x(1,1) = (cos(x2*x3)+0.5)/3;
    x(1,2) = -sqrt(x1^2+sin(x3)+1.06)/9-0.1;
    x(1,3) = ((3-pi*10)/3-exp(-x1*x2))/20;
    fprintf("k=%d, x=[%f,%f,%f]\n", k, x(1,1), x(1,2), x(1,3));
end

% Newton法
fprintf("Newton迭代法:\n");
x0=[0; 0; 0];
fprintf("x0=[0; 0; 0]\n");
k = 1;
for k=1:10
    x0 = newton_nonlinear_iteration(x0);
    fprintf("k=%d, x=[%f,%f,%f]\n", k, x0(1,1), x0(2,1), x0(3,1));
end

x0=[1; 1; 1];
fprintf("x0=[1; 1; 1]\n");
k = 1;
for k=1:10
    x0 = newton_nonlinear_iteration(x0);
    fprintf("k=%d, x=[%f,%f,%f]\n", k, x0(1,1), x0(2,1), x0(3,1));
end

x0=[-1; -1; -1];
fprintf("x0=[-1; -1; -1]\n");
k = 1;
for k=1:10
    x0 = newton_nonlinear_iteration(x0);
    fprintf("k=%d, x=[%f,%f,%f]\n", k, x0(1,1), x0(2,1), x0(3,1));
end