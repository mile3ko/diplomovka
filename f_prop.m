function [a1,a2,Z1,Z2]  = f_prop(X,W1,W2,b1,b2,m)
%m- pocet  dat
B1=b1*ones(1,m); 
Z1=W1*X+B1; 
a1=tanh(Z1);
Z2=W2*a1+ones(1,m)*b2;
a2=1./(1+exp(-Z2));

end