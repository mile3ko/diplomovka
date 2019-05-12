function [W1,b1,W2,b2,W3,b3,W4,b4] = upda4(W1,b1,W2,b2,W3,b3,W4,b4,dW1,db1,dW2,db2,dW3,db3,dW4,db4,alfa)
W1=W1-alfa*dW1;
b1=b1-alfa*db1;
W2=W2-alfa*dW2;
b2=b2-alfa*db2;
W3=W3-alfa*dW3;
b3=b3-alfa*db3;
W4=W4-alfa*dW4;
b4=b4-alfa*db4;
end