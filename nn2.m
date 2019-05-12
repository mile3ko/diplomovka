m_train=5000;  % velkost trenovacej vzorky max 24000
m_test=1000;    % velkost testovacej vzorky
rozmer=64;    % rozmer obrazku

[train_set_1D,test_set_1D]=nac_obr(m_train,m_test,rozmer); %nacitanie obrazkov

n1=rozmer*rozmer*3; % pocet neuronov v 1 vrstve
n2=100;              % pocet neuronov v 2 vrstve
n3=1;  % pocet neuronov v 3 vrstve

MPI=100; % pocet iteracii
alfa=0.03;  %  learning rate
% inicializacia zacitockych vah a biasov
W1= 1/sqrt(n1).*randn(n2,n1); 
W2= 1/sqrt(n2).*randn(n3,n2); 
b1= 0*randn(n2,1); 
b2= 0*randn(1,n3);
% nacitanie vstupnych dat
X=train_set_1D;
% label trenovacich dat
y1=ones(m_train/2,1);
y2=zeros(m_train/2,1);
Y = vertcat(y1,y2);
Y=Y';

%label testovacich dat
y1=ones(m_test/2,1);
y2=zeros(m_test/2,1);
YY = vertcat(y1,y2);
label_test=YY';

JJ=ones(MPI,1); %vektor hodnot nakladovej funkcie
 %matica hodnot odhadnutych hodnot
% vylepsovanie  vah a biasov
for i=1:MPI

    [a1,a2,Z1,Z2]=f_prop(X,W1,W2,b1,b2,m_train); % forward propagation

 JJ(i)= naklady2(Y,a2,m_train);           % hodnota nakl. funkcia
  
 [dW2,db2,dW1,db1]=back_prop(W1,W2,a1,a2,X,Y,m_train);  % backward propagation

if mod(i,10) ==0
    i
    sp_train(i/10)=spravnost2(a2,Y,m_train);
    [at1,at2,ZZ1,ZZ2]=f_prop(test_set_1D,W1,W2,b1,b2,m_test);
  sp_test(i/10)=spravnost2(at2,label_test,m_test);
end  
[W1,b1,W2,b2] = upda(W1,b1,W2,b2,dW1,db1,dW2,db2,alfa);  % update vah a biasu
end


