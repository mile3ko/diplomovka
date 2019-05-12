
rozmer=32;    % rozmer obrazku
MPI=500; % pocet iteracii
alfa=0.001;  %  learning rate
m_train=240;  % velkost trenovacej vzorky max 24000
m_test=100;    % velkost testovacej vzorky
m_batch=100; %  velkost vzorky
n1=rozmer*rozmer*3; % pocet neuronov v 1 vrstve
n2=10;              % pocet neuronov v 2 vrstve
n3=1;  % pocet neuronov v 3 vrstve

% inicializacia zacitockych vah a biasov
W1= 1/sqrt(n1).*randn(n2,n1); 
W2= 1/sqrt(n2).*randn(n3,n2); 
b1= 0*randn(n2,1); 
b2= 0*randn(1,n3);

[X,test_set_1D]=nac_obr_32(m_train,m_test,rozmer); %nacitanie obrazkov



% label trenovacich dat
y1=ones(m_train/2,1);
y2=zeros(m_train/2,1);
Y = vertcat(y1,y2);
Y=Y';
% spojenie vstupnych a vystupnych dat do jednej matice
XY=vertcat(Y,X);
%label testovacich dat
y1=ones(m_test/2,1);
y2=zeros(m_test/2,1);
YY = vertcat(y1,y2);
label_test=YY';

J_train=zeros(MPI,1); %vektor hodnot nakladovej funkcie
J_test=zeros(MPI,1); 
sp_train=0;
sp_test=0;%vektor hodnot nakladovej funkcie
 %matica hodnot odhadnutych hodnot
% vylepsovanie  vah a biasov
for i=1:MPI
%nahodne premiesanie stlpcov vstupnych dat
XY=XY(:,randperm(size(XY,2)));

 % SGD
for k=1: m_train/m_batch
    XY_batch=XY(:,(k-1)*m_batch+1:k*m_batch);
    X_batch=XY_batch(2:n1+1,:);
    Y_batch=XY_batch(1,:);
    [a1,a2,Z1,Z2]=f_prop(X_batch,W1,W2,b1,b2,m_batch); % forward propagation
     
   [dW2,db2,dW1,db1]=back_prop(W1,W2,a1,a2,X_batch,Y_batch,m_batch);  % backward propagation 
    [W1,b1,W2,b2] = upda(W1,b1,W2,b2,dW1,db1,dW2,db2,alfa);  % update vah a biasu
end

i
     [a1,a2,Z1,Z2]=f_prop(X,W1,W2,b1,b2,m_train);
    sp_train(i)=spravnost2(a2,Y,m_train);
    [at1,at2,ZZ1,ZZ2]=f_prop(test_set_1D,W1,W2,b1,b2,m_test);
  sp_test(i)=spravnost2(at2,label_test,m_test);
  J_train(i)= naklady2(Y,a2,m_train);   
  J_test(i)= naklady2(label_test,at2,m_test); % hodnota nakl. funkcia
end  



