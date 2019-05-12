function [W1,b1] = upda(W1,b1,dW1,db1,alfa)
W1=W1-alfa*dW1;
b1=b1-alfa*db1;

end