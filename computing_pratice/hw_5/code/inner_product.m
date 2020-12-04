function sum = inner_product(x1,x2,p,q)
sum = 0;
m = length(x1);
for i = 1:m
    sum = sum + (x1(i)^p * x2(i)^q);
end
end

