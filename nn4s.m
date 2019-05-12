
rozmer=64;    % rozmer obrazku
m_train=18000;  % velkost trenovacej vzorky max 20000
m_test=5000;    % velkost testovacej vzorky
m_batch=50; %  velkost vzorky
[X,test_set_1D]=nac_obr(m_train,m_test,rozmer); %nacitanie obrazkov

n1=rozmer*rozmer*3; % pocet neuronov v 1 vrstve
n2=2000;   % pocet neuronov v 2 vrstve
n3=2000;% pocet neuronov v 3 vrstve
n4=2000;
n5=1;% pocet neuronov v 5 vrstve
MPI=200; % pocet iteracii
alfa=0.0001;  %  learning rate
lamb=0.0001;

% label trenovacich dat
y1=ones(m_train/2,1);
y2=zeros(m_train/2,1);
Y = vertcat(y1,y2);
Y=Y';
% spojenie vstupnych a vystupnych dat do jednej matice
XY=vertcat(Y,X);
clear X;
%label testovacich dat
y1=ones(m_test/2,1);
y2=zeros(m_test/2,1);
YY = vertcat(y1,y2);
label_test=YY';
clear YY


% inicializacia zacitockych vah a biasov
W1= 1/sqrt(n1).*randn(n2,n1); 
W2= 1/sqrt(n2).*randn(n3,n2); 
W3= 1/sqrt(n3).*randn(n4,n3);
W4= 1/sqrt(n4).*randn(n5,n4);
b1= 0*randn(n2,1); 
b2= 0*randn(n3,1); 
b3= 0*randn(n4,1);
b4= 0*randn(1,n5);

J_train=0;%vektor hodnot nakladovej funkcie train sady
J_test=0;%vektor hodnot nakladovej funkcie test sady
sp_train=0;
sp_test=0;
for i=1:MPI
%nahodne premiesanie stlpcov vstupnych dat
XY=XY(:,randperm(size(XY,2)));

 
for k=1: m_train/m_batch
    XY_batch=XY(:,(k-1)*m_batch+1:k*m_batch);
    X_batch=XY_batch(2:n1+1,:);
    Y_batch=XY_batch(1,:);
    [a1,a2,a3,a4,Z1,Z2,Z3,Z4]=f_prop4(X_batch,W1,W2,W3,W4,b1,b2,b3,b4,m_batch); % forward propagation
    [dW4,db4,dW3,db3,dW2,db2,dW1,db1]=back_prop4(W1,W2,W3,W4,a1,a2,a3,a4,X_batch,Y_batch,m_batch);  % backward propagation 
    [W1,b1,W2,b2,W3,b3,W4,b4] = upda4_reg(W1,b1,W2,b2,W3,b3,W4,b4,dW1,db1,dW2,db2,dW3,db3,dW4,db4,alfa,lamb,m_train);  % update vah a biasu
end


   i
  [a1,a2,a3,a4,Z1,Z2,Z3,Z4]=f_prop4(XY(2:n1+1,:),W1,W2,W3,W4,b1,b2,b3,b4,m_train);
  sp_train(i)=spravnost2(a4,XY(1,:),m_train)
  [at1,at2,at3,at4,ZZ1,ZZ2,ZZ3,ZZ4]=f_prop4(test_set_1D,W1,W2,W3,W4,b1,b2,b3,b4,m_test);
  sp_test(i)=spravnost2(at4,label_test,m_test)
  J_train(i)= naklady2(XY(1,:),a4,m_train)
 J_test(i)= naklady2(label_test,at4,m_test) 
end

