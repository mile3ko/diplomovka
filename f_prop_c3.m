function [a1,a2,a3,Z1,Z2,Z3]  = f_prop_c3(X,W1,W2,W3,b1,b2,b3,m)
%m- pocet  dat
B1=b1*ones(1,m); 
Z1=W1*X+B1; 
a1=tanh(Z1);

B2=b2*ones(1,m); 
Z2=W2*a1+B2; 
a2=tanh(Z2);

Z3=W3*a2+b3*ones(1,m);
a3=1./(1+exp(-Z3));

end