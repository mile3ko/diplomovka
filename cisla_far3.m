%testujeme
m_train=400;  % velkost trenovacej vzorky
m_test=1;
m_val=100;
rozmer=32;
lamb= 50;
MPI=500; % pocet iteracii
alfa=0.01;  %  learning rate
m_batch=50; %  velkost vzorky
n1=rozmer*rozmer*3; % pocet neuronov v 1 vrstve
n2=500;              % pocet neuronov v 2 vrstve
n3=500;
n4=10;  % pocet neuronov v 3 vrstve

[X,test_set_1D,X_val,labels,label_test,label_val]=nac_obr_cis_far(m_train,m_test,m_val);

targetValues = 0.*ones(10, size(labels, 1));
    for n = 1: size(labels, 1)
        targetValues(labels(n) + 1, n) = 1;
    end;
Y=targetValues;
targetValues = 0.*ones(10, size(label_val, 1));
    for n = 1: size(label_val, 1)
        targetValues(label_val(n) + 1, n) = 1;
    end;
label_val=targetValues;



% inicializacia zacitockych vah a biasov
W1= 1/sqrt(n1).*randn(n2,n1); 
W2= 1/sqrt(n2).*randn(n3,n2); 
W3= 1/sqrt(n3).*randn(n4,n3); 
b1= 0*randn(n2,1); 
b2= 0*randn(n3,1);
b3= 0*randn(n4,1);
% spojenie vstupnych a vystupnych dat do jednej matice
XY=vertcat(Y,X);
clear X;
J_train=0;%vektor hodnot nakladovej funkcie train sady
J_val=0;%vektor hodnot nakladovej funkcie test sady
sp_train=0;
sp_val=0;
 %matica hodnot odhadnutych hodnot
% vylepsovanie  vah a biasov
for i=1:MPI
%nahodne premiesanie stlpcov vstupnych dat
XY=XY(:,randperm(size(XY,2)));

 % SGD
for k=1: m_train/m_batch
    XY_batch=XY(:,(k-1)*m_batch+1:k*m_batch);
    X_batch=XY_batch(11:n1+10,:);
    Y_batch=XY_batch(1:10,:);
    [a1,a2,a3,Z1,Z2,Z3]=f_prop_c3(X_batch,W1,W2,W3,b1,b2,b3,m_batch); % forward propagation
   [dW3,db3,dW2,db2,dW1,db1]=back_prop_c3(W1,W2,W3,a1,a2,a3,X_batch,Y_batch,m_batch);  % backward propagation 
    [W1,b1,W2,b2,W3,b3] = upda3_reg(W1,b1,W2,b2,W3,b3,dW1,db1,dW2,db2,dW3,db3,alfa,lamb,m_train);  % update vah a biasu
end

 i
     [a1,a2,a3,Z1,Z2,Z3]=f_prop_c3(XY(11:n1+10,:),W1,W2,W3,b1,b2,b3,m_train);
    [at1,at2,at3,ZZ1,ZZ2,ZZ3]=f_prop_c3(X_val,W1,W2,W3,b1,b2,b3,m_val);
  J_train(i)= naklady_c2(XY(1:10,:),a3,m_train)
  J_val(i)= naklady_c2(label_val,at3,m_val) % hodnota nakl. funkcia
  sp_train(i)=spravnost_c(a3,XY(1:10,:))   
  sp_val(i)=spravnost_c(at3,label_val)
end  




