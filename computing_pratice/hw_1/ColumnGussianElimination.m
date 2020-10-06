function ColumnGussianElimination(A,b)
% GussianColumnElimination ����Ԫ��˹��ȥ����ʵ��
% A��ϵ������
% b���Ҷ���
% x��������

% ���A, b, detA
disp('A:');
disp(A);
disp('b:');
disp(b);
disp('detA:');
disp(det(A));

% ��չϵ�������Ϊ�������
Ab=[A,b];

% n����δ֪���ĸ���
[n, n]=size(A);
x=zeros(n,1);

% ѡ��Ԫ
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
    % �ж��Ƿ���Ҫ����
    if max_row~=i
        disp("��Ҫ����")
        % �������У����ó����б任������
        E=eye(n);
        E([i,max_row],:)=E([max_row,i],:);
        Ab=E*Ab;
    else
        disp("����Ҫ����")
    end
    % ��Ԫ
    for j=i+1:n
        Ab(j,i)=0;
        for k=i+1:n+1
            Ab(j,k)=Ab(j,k)-Ab(j,i)*Ab(i,k)/Ab(i,i);
        end
    end
    Ab
end
% �ش�



disp("������x��")
disp(x)

end

