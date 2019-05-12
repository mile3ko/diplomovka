function [dW1,db1] = back_prop_c(W1,a1,X,Y,m)
dz1=a1-Y;
dW1=1/m.*(X*dz1')';
db1=1/m*(sum(dz1'))';
end