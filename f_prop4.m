function [a1,a2,a3,a4,Z1,Z2,Z3,Z4]  = f_prop4(X,W1,W2,W3,W4,b1,b2,b3,b4,m)
%m- pocet  dat
B1=b1*ones(1,m); 
Z1=W1*X+B1; 
a1=tanh(Z1);

B2=b2*ones(1,m); 
Z2=W2*a1+B2; 
a2=tanh(Z2);

B3=b3*ones(1,m); 
Z3=W3*a2+B3; 
a3=tanh(Z3);

Z4=W4*a3+ones(1,m)*b4;
a4=1./(1+exp(-Z4));

end