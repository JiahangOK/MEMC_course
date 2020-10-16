for n=[10,20,40]
    fprintf("n=%d:\n",n);
    A=zeros(n,n);
    b=zeros(n,1);
    % 构造五对角矩阵
    for k=1:n
        for j=1:n
            if k==j
                A(k,j)=20;
            elseif abs(k-j)==1
                A(k,j)=-8;
            elseif abs(k-j)==2
                A(k,j)=1;
            else
                A(k,j)=0;
            end
        end
    end

    % Jacobi迭代
    JacobiIteration(n,A,b);

    % SOR迭代
    for w=[1, 1.2, 1.4, 1.6, 1.8]
        SORIteration(n,A,b,w);
    end
end