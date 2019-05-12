function [W1,b1,W2,b2,W3,b3] = upda3(W1,b1,W2,b2,W3,b3,dW1,db1,dW2,db2,dW3,db3,alfa)
W1=W1-alfa*dW1;
b1=b1-alfa*db1;
W2=W2-alfa*dW2;
b2=b2-alfa*db2;
W3=W3-alfa*dW3;
b3=b3-alfa*db3;
end