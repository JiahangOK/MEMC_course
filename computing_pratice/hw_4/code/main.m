fprintf("幂法：\n");
A = [5,4,1,1;4,5,1,1;1,1,4,2;1,1,2,4];
v = [1,1,1,1]';
m = 0;
k = 1;
while true
    z = A*v;
    m_pre = m;
    [m,p]=max(abs(z));
        m = z(1,p);
    v = z/m;
    fprintf("## k=%d\n", k);
    fprintf("m=%f\n", m);
    if abs(m-m_pre) < 1e-6
        break
    end
    k = k + 1;
%     v'
end
v'
fprintf(" ========================== \n");

fprintf("Aitken 加速后：\n");
v = [1,1,1,1]';
m_list=[];
k = 1;
lambda = 0;
while true
    z = A*v;
    [m,p]=max(abs(z));
        m = z(1,p);
    v = z/m;
    m_list=[m_list,m];
    fprintf("## k=%d\n", k);
    if k>2
        lambda_pre = lambda;
        lambda=(m_list(1,k)*m_list(1,k-2)-m_list(1,k-1)^2)/(m_list(1,k)-2*m_list(1,k-1)+m_list(1,k-2));
        fprintf("lambda=%f\n", lambda);
        if abs(lambda_pre-lambda) < 1e-6
            break
        end
    end
    k = k + 1;
%     v'
end
v'
fprintf(" ========================== \n");
fprintf("逆幂迭代法：\n");
A = [5,4,1,1;4,5,1,1;1,1,4,2;1,1,2,4];
v=[1,1,1,1]';
m = 0;
max_iter_value = 10000; 
q_list = [0, 0.9, 1.5, 6, 11,2.3];
for q = q_list
    fprintf("# q=%.6f\n", q);
    v=[1,1,1,1]';
    k = 1;
    while true
        z=(A-q*eye(4))\v;
        pre_m = m;
        [m,p]=max(abs(z));
        m = z(p,1);
        if abs(m-pre_m) < 1e-6
            fprintf("收敛\n"); 
            break
        end
        if k > max_iter_value
            fprintf("不收敛\n"); 
            break
        end
        v=z/m;
        k = k + 1;
    end
    fprintf("k=%d\n", k);       
    fprintf("m^-1+q= %f\n", 1/m+q);
    v'
end
A = [5,4,1,1;4,5,1,1;1,1,4,2;1,1,2,4];
[x,y]=eig(A)
