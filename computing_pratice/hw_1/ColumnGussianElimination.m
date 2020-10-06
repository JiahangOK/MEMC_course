function ColumnGussianElimination(A,b)
% GussianColumnElimination 列主元高斯消去法的实现
% A：系数矩阵
% b：右端项
% x：解向量

% 输出A, b, detA
disp('A:');
disp(A);
disp('b:');
disp(b);
disp('detA:');
disp(det(A));

% 扩展系数矩阵成为增广矩阵
Ab=[A,b];

% n代表未知数的个数
[n, n]=size(A);
x=zeros(n,1);

% 选主元
for i=1:n-1
    disp("i:")
    disp(i)
    max_num=abs(Ab(i,i));
    max_row=i;
    for j=i+1:n
        if abs(Ab(j,i))>max_num
            max_num=abs(Ab(j,i));
            max_row=j;
        end
    end
    % 判断是否需要换行
    if max_row~=i
        disp("需要换行")
        % 交换两行，利用初等行变换的性质
        E=eye(n);
        E([i,max_row],:)=E([max_row,i],:);
        Ab=E*Ab;
    else
        disp("不需要换行")
    end
    % 消元
    for j=i+1:n
        Ab(j,i)=0;
        for k=i+1:n+1
            Ab(j,k)=Ab(j,k)-Ab(j,i)*Ab(i,k)/Ab(i,i);
        end
    end
    Ab
end
% 回代



disp("解向量x：")
disp(x)

end

