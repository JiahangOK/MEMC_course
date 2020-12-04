a = 1;
b = 3;
h = b - a;
T = zeros(100,100);
f = @(x)(10/x)^2*sin(10/x);
T(1,1) = (h/2)*(f(a)+f(b));
T(2,1) = Tf(a,b,1,f);
T(2,2) = (4*T(2,1)-T(1,1))/(4-1);
j = 2;
while abs(T(j,j)-T(j-1,j-1)) >= 1e-4
    j = j + 1;
    for k = 1:1:j
        if k==1
            T(j,k) = Tf(a,b,j-1,f);
        else 
            T(j,k) = (4^(k-1)*T(j,k-1)-T(j-1,k-1))/(4^(k-1)-1);
        end
    end
end
fprintf("j=%d, T(j,j)=%.16f\n",j-1,T(j,j));
fprintf("T表：\n")

for m=1:1:j
    for n=1:1:m
        fprintf("T(%d,%d)=%.7f,",m-1,n-1,T(m,n));
    end
    fprintf("\n");
end