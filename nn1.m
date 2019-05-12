m_train=1000;   % velkost trenovacej vzorky
m_test=1000;    % velkost testovacej vzorky
rozmer=64;          % rozmer obrazku
n1=rozmer*rozmer*3; % pocet neuronov v 1 vrstve

% label testovacej vzorky 
%{ 
label_test=[0,0,0,0,1,1,1,1,1,1,...
       1,0,1,1,1,1,0,0,1,1,...
       0,1,0,0,1,0,0,1,1,0,...
       0,0,0,1,1,1,1,1,0,1,...
       0,0,0,0,1,0,1,0,0,1,...
       1,1,1,1,1,0,0,1,0,1,...
       1,0,1,1,0,0,0,1,0,0,...
       0,0,0,0,1,0,0,0,0,1,...
       1,1,0,1,0,0,0,0,1,1,...
       1,1,1,0,0,1,0,0,1,1];
  %} 
y1=ones(m_test/2,1);
y2=zeros(m_test/2,1);
YY = vertcat(y1,y2);
label_test=YY';

% vytvorenie vektora labelov trenovaciu vzorku
y1=ones(m_train/2,1);
y2=zeros(m_train/2,1);
Y = vertcat(y1,y2);
Y=Y';
%nacitanie obrazkov
[train_set_1D,test_set_1D]=nac_obr(m_train,m_test,rozmer);
%nacitanie vstupnych dat do matice X
X=train_set_1D;

% uvodna inicializacia vah a parametrov
w=1/sqrt(n1).*randn(rozmer*rozmer*3,1);
b=0;
MPI=20000;
alfa=0.005;
JJ=zeros(1,MPI)
% optimalizacia  pre vopred urceny pocet  iteracii
tic
for i =1: MPI

[w,b,dJdw,dJdb,J]=optimalizacia(X,Y,w,b,alfa,0,0);
JJ(i)=J;
if mod(i,100) ==0
    i
  sp_train(i/100)=spravnost(X,Y,w,b,m_train);
  sp_test(i/100)=spravnost(test_set_1D,label_test,w,b,m_test);
    
end   
end
toc
%plot(1:m_train/2,a_fin(1:m_train/2),'o')
%hold on
%plot(m_train/2:m_train,a_fin(m_train/2:m_train),'x')




