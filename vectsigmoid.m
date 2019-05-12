 function [a,da,z]  = vectsigmoid(X,w,b)
 for i=1:length(X(1,:))
    z(i)=w'*X(:,i)+b;
    a(i)=1/(1+exp(-z(i)));
    da(i)= a(i)*(1-a(i));
 end
 
 a;
da;
 end