function [k,B_J]=JacobiIteration(n,A,b)
%JACOBIITERATION Jacoobi迭代法
%   n：系数矩阵的维度
%   A：系数矩阵
%   b：右端项
%   k：迭代次数
%   B_J：迭代矩阵

k=0; % 迭代次数
x=ones(n,1); % 初始解向量

% 构造系数矩阵的对角部分D，严格上三角部分-U，严格下三角部分-L
D=zeros(n,n);
L=zeros(n,n);
U=zeros(n,n);
for m=1:n
    for j=1:n
        if m==j
            D(m,j)=A(m,j);
            L(m,j)=0;
            U(m,j)=0;
        elseif m>j
            D(m,j)=0;
            L(m,j)=0;
            U(m,j)=-A(m,j);
        elseif m<j
            D(m,j)=0;
            L(m,j)=-A(m,j);
            U(m,j)=0;
        end
    end
end

% 构造迭代矩阵B_J
B_J=D\(L+U);
f_J=D\b;

% 迭代
while norm(x,inf)>1e-6
    x=B_J*x+f_J;
    k=k+1;
end

end

