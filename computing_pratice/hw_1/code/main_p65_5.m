disp("====(1)====")
y=zeros(1,10)
for n=1:10
    H=hilbert(n);
    disp(['n=' num2str(n)]);
    disp(['cond inf=' num2str(cond(H, inf))]);
    y(1,n)=cond(H, inf);
end

x = [1:1:5];
plot(x, y(1,1:5),'rx-'), xlabel('n'), ylabel('cond'), legend('cond(H) inf')

disp("====(2)&(3)====")
for n=1:20
    disp(['n=' num2str(n)]);
    x=ones(n,1);
    H=hilbert(n);
    b=H*x;
    % Gauss消去法解方程组
    x_tilde=ColumnGussianElimination(H,b);
    % 计算剩余向量
    r=b-H*x_tilde;
    % 计算误差向量
    delta_x=x_tilde-x;
    
    r
    delta_x
    
    % 分析有效数字位数
    ineffective_num=0; % x_tilde向量中无效数字个数,无效数字就是有效数字位数是0
    for j=1:n
        if abs(delta_x(j,1))>0.5
            ineffective_num=ineffective_num+1;
        end
    end
    ineffective_num % x_tilde向量中无效数字个数
    
end

