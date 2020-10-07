function [H] = hilbert(n)
% HILBERT ����ά������һ��Hilbert����
% n������ά��

H=zeros(n,n);
for i=1:n
    for j=1:n
        H(i,j)=1/(i+j-1);
    end
end
end

