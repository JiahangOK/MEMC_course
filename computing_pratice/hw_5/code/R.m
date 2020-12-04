function y = R(n)
sum = 0;
h = (1.5-0.2)/(2^n);
for i=0.2:h:1.5
    if i==0.2 || i==1.5
        sum = sum + exp(-(i)^2);
    else
        sum = sum + 2 * exp(-(i)^2);
    end 
end
y = (h / 2) * sum;
end
