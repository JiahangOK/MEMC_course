function x=ColumnGussianElimination(A,b)
% GussianColumnElimination ����Ԫ��˹��ȥ����ʵ��
% A��ϵ������
% b���Ҷ���
% x��������

% ��չϵ�������Ϊ�������
Ab=[A,b];

% n����δ֪���ĸ���
[~, n]=size(A);
x=zeros(n,1);

% ����Ԫ��˹��ȥ
for i=1:n-1
    % ѡ��Ԫ
    max_num=abs(Ab(i,i));
    max_row=i;
    for j=i+1:n
        if abs(Ab(j,i))>max_num
            max_num=abs(Ab(j,i));
            max_row=j;
        end
    end
    
    % �ж��Ƿ���Ҫ����
    if max_row~=i
        % �������У����ó����б任������
        E=eye(n);
        E([i,max_row],:)=E([max_row,i],:);
        Ab=E*Ab;
    end
    
    % ��Ԫ
    for j=i+1:n
        l=Ab(j,i)/Ab(i,i);
        Ab(j,i)=0;
        for k=i+1:n+1
            Ab(j,k)=-l*Ab(i,k)+Ab(j,k);
        end
    end
end

% �ش�
for i=n:-1:1
    sum=0;
    for j=i:n
        sum=sum+x(j,1)*Ab(i,j);
    end
    x(i,1)=(Ab(i,n+1)-sum)/Ab(i,i);
end
end
