function [W1,b1,W2,b2] = upda2_reg(W1,b1,W2,b2,dW1,db1,dW2,db2,alfa,lamb,m_train)
W1=(1-alfa*lamb/m_train)*W1-alfa*dW1;
b1=b1-alfa*db1;
W2=(1-alfa*lamb/m_train)*W2-alfa*dW2;
b2=b2-alfa*db2;
end