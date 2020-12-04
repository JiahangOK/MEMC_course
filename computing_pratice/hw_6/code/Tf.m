function y = Tf(a,b,n,f)
sum = 0;
h = (b-a)/(2^n);
for i=a:h:b
    if i==a|| i==b
        sum = sum + f(i);
    else
        sum = sum + 2 * f(i);
    end 
end
y = (h / 2) * sum;
end

