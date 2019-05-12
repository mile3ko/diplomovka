function [dW3,db3,dW2,db2,dW1,db1] = back_prop3(W1,W2,W3,a1,a2,a3,X,Y,m)
dz3=a3-Y;
dW3=1/m.*(a2*dz3')';
db3=1/m*(sum(dz3));

Dva=ones(size(a2));
dz2=W3'*dz3.*(Dva-a2.*a2);
dW2=1/m.*(dz2*a1');
db2=(1/m*sum(dz2'))';

Jeden=ones(size(a1));
dz1=W2'*dz2.*(Jeden-a1.*a1);
dW1=1/m.*(dz1*X');
db1=(1/m*sum(dz1'))';
end