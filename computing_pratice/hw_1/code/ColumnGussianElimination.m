function x=ColumnGussianElimination(A,b)
% GussianColumnElimination 列主元高斯消去法的实现
% A：系数矩阵
% b：右端项
% x：解向量

% 扩展系数矩阵成为增广矩阵
Ab=[A,b];

% n代表未知数的个数
[~, n]=size(A);
x=zeros(n,1);

% 列主元高斯消去
for i=1:n-1
    % 选主元
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
        % 交换两行，利用初等行变换的性质
        E=eye(n);
        E([i,max_row],:)=E([max_row,i],:);
        Ab=E*Ab;
    end
    
    % 消元
    for j=i+1:n
        l=Ab(j,i)/Ab(i,i);
        Ab(j,i)=0;
        for k=i+1:n+1
            Ab(j,k)=-l*Ab(i,k)+Ab(j,k);
        end
    end
end

% 回代
for i=n:-1:1
    sum=0;
    for j=i:n
        sum=sum+x(j,1)*Ab(i,j);
    end
    x(i,1)=(Ab(i,n+1)-sum)/Ab(i,i);
end
end

