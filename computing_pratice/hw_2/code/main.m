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
    [k,B_J]=JacobiIteration(n,A,b);
    fprintf("Jacobi迭代次数：%d\n", k)
    fprintf("收敛速度：%.4f\n",-log(max(abs(eig(B_J)))))

    % SOR迭代
    for w=[1, 1.2, 1.4, 1.6, 1.8]
        [k,L_w]=SORIteration(n,A,b,w);
        fprintf("w=%.1f，SOR迭代次数：%d\n",w,k)
        fprintf("收敛速度：%.4f\n",-log(max(abs(eig(L_w)))))
    end
    
    % SOR谱半径和松弛因子w的关系图
    if n==10
        x=[1:0.1:1.9];
        y=zeros(1,size(x,2));
        y
        r=1;
        for w=[1:0.1:1.9]
            [k,L_w]=SORIteration(n,A,b,w);
            y(1,r)=max(abs(eig(L_w)));
            r=r+1;
            r
        end
        plot(x, y(1,1:r-1),'rx-'), xlabel('w'), ylabel('\rho(L_w)')
    end
end