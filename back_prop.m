function [dW2,db2,dW1,db1] = back_prop(W1,W2,a1,a2,X,Y,m)
dz2=a2-Y;
dW2=1/m.*(a1*dz2')';
db2=1/m*(sum(dz2));
Jeden=ones(size(a1));
dz1=W2'*dz2.*(Jeden-a1.*a1);
dW1=1/m.*(dz1*X');
db1=(1/m*sum(dz1'))';
end