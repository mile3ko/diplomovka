function [a1,Z1]  = f_prop_c(X,W1,b1,m)
%m- pocet  dat
B1=b1*ones(1,m); 
Z1=W1*X+B1; 
a1=1./(1+exp(-Z1));

end