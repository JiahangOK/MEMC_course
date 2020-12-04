function res = third_order_mean_difference(x,y,i)
f1 = (y(1,i+1)-y(1,i))/(x(1,i+1)-x(1,i));
f2 = (y(1,i+2)-y(1,i+1))/(x(1,i+2)-x(1,i+1));
res = (f2-f1)/(x(1,i+2)-x(1,i));
end

