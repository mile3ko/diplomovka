function [W1,b1,W2,b2] = upda2(W1,b1,W2,b2,dW1,db1,dW2,db2,alfa)
W1=W1-alfa*dW1;
b1=b1-alfa*db1;
W2=W2-alfa*dW2;
b2=b2-alfa*db2;
end