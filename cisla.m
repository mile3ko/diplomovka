%testujeme
X=loadMNISTImages('M:\train-images.idx3-ubyte');
labels=loadMNISTLabels('M:\train-labels.idx1-ubyte');

test_set_1D=loadMNISTImages('M:\t10k-images.idx3-ubyte');
label_test=loadMNISTLabels('M:\t10k-labels.idx1-ubyte');


targetValues = 0.*ones(10, size(labels, 1));
    for n = 1: size(labels, 1)
        targetValues(labels(n) + 1, n) = 1;
    end;
Y=targetValues;

targetValues = 0.*ones(10, size(label_test, 1));
    for n = 1: size(label_test, 1)
        targetValues(label_test(n) + 1, n) = 1;
    end;
label_test=targetValues;
rozmer=28;    % rozmer obrazku
MPI=50; % pocet iteracii
alfa=0.001;  %  learning rate
m_train=60000;  % velkost trenovacej vzorky max 24000
m_test=10000;    % velkost testovacej vzorky
m_batch=100; %  velkost vzorky
n1=rozmer*rozmer; % pocet neuronov v 1 vrstve
n2=16;              % pocet neuronov v 2 vrstve
n3=10;  % pocet neuronov v 3 vrstve

% inicializacia zacitockych vah a biasov
W1= 1/sqrt(n1).*randn(n2,n1); 
W2= 1/sqrt(n2).*randn(n3,n2); 
b1= 0*randn(n2,1); 
b2= 0*randn(n3,1);
% spojenie vstupnych a vystupnych dat do jednej matice
XY=vertcat(Y,X);

JJ=ones(MPI,1); %vektor hodnot nakladovej funkcie
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
    [a1,a2,Z1,Z2]=f_prop_c(X_batch,W1,W2,b1,b2,m_batch); % forward propagation
     
   [dW2,db2,dW1,db1]=back_prop_c(W1,W2,a1,a2,X_batch,Y_batch,m_batch);  % backward propagation 
    [W1,b1,W2,b2] = upda(W1,b1,W2,b2,dW1,db1,dW2,db2,alfa);  % update vah a biasu
end

i
     [a1,a2,Z1,Z2]=f_prop_c(X,W1,W2,b1,b2,m_train);
    sp_train(i)=spravnost_c(a2,Y);
    [at1,at2,ZZ1,ZZ2]=f_prop_c(test_set_1D,W1,W2,b1,b2,m_test);
  sp_test(i)=spravnost_c(at2,label_test);
  JJ(i)= naklady_c(Y,a2,m_train);           % hodnota nakl. funkcia
end  




