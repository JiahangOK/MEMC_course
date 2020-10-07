function [H] = hilbert(n)
% HILBERT 根据维数生成一个Hilbert矩阵
% n：矩阵维度

H=zeros(n,n);
for i=1:n
    for j=1:n
        H(i,j)=1/(i+j-1);
    end
end
end

