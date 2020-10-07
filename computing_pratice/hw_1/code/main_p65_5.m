disp("====(1)====")
for n=1:10
    H=hilbert(n);
    disp(['n=' num2str(n)]);
    disp(['cond inf=' num2str(cond(H, inf))]);
end

disp("====(2)====")
for n=1:10
    disp(['n=' num2str(n)]);
    x=ones(n,1);
    H=hilbert(n);
    b=H*x;
    b
    % Gauss消去法解方程组
    x_tilde=ColumnGussianElimination(H,b);
    % 计算剩余向量
    r=b-H*x_tilde;
    % 计算误差向量
    delta_x=x_tilde-x;
    
    r
    delta_x
    
end

disp("====(3)====")