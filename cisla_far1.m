%testujeme
m_train=5000;  % velkost trenovacej vzorky max 24000
m_test=1;
m_val=1000;
m_batch=5000; %  velkost vzorky
rozmer=32;

MPI=100000; % pocet iteracii
alfa=0.025;  %  learning rate f1=0.05,f2=0.02 f3=0.01 f4=0.001 f5=0.0001

n1=rozmer*rozmer*3; % pocet neuronov v 1 vrstve
n2=10;  % pocet neuronov v 2 vrstve

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

b1= 0*randn(n2,1); 

% spojenie vstupnych a vystupnych dat do jednej matice
XY=vertcat(Y,X);

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
    [a1,Z1]=f_prop_c(X_batch,W1,b1,m_batch); % forward propagation
   [dW1,db1]=back_prop_c(W1,a1,X_batch,Y_batch,m_batch);  % backward propagation 
    [W1,b1] = upda(W1,b1,dW1,db1,alfa);  % update vah a biasu
end

 if mod(i,100) ==0
     i
     [a1,Z1]=f_prop_c(X,W1,b1,m_train);
    sp_train(i/100)=spravnost_c(a1,Y)
    [at1,ZZ1]=f_prop_c(X_val,W1,b1,m_val);
  sp_val(i/100)=spravnost_c(at1,label_val)
  J_train(i/100)= naklady_c2(Y,a1,m_train)
  J_val(i/100)= naklady_c2(label_val,at1,m_val) % hodnota nakl. funkcia
 end   
end  




