%generovanie dat, tento kus kodu ste mi poslali  vy 
n = 2;
randn('state',2);
N = 50; M = 50;
Y = [1.5+0.9*randn(1,0.6*N), 1.5+0.7*randn(1,0.4*N);
     2*(randn(1,0.6*N)+1), 2*(randn(1,0.4*N)-1)];
X = [-1.5+0.9*randn(1,0.6*M),  -1.5+0.7*randn(1,0.4*M);
      2*(randn(1,0.6*M)-1), 2*(randn(1,0.4*M)+1)];
T = [-1 1; 1 1];
Y = T*Y;  X = T*X; 

%vykreslenie dat
plot(X(1,:),X(2,:),'o')
hold on
plot(Y(1,:),Y(2,:),'+')

% pocet dat 
m=100;
% pocet charakteristik
n=1; 
% vytvorenie vektora s hodnotami 0,1 
y1=zeros(50,1);
y2=ones(50,1);
y_train = vertcat(y1,y2); % spojenie vektorov nul a jednotiek  do jedneho vektora (label vektor)
% jednotkovy vektor
u1=ones(1,100);
% vektor vstupnych hodnot 
train_set_1D= horzcat(X(2,:),Y(2,:))
% pripojenie jednotkoveho vektoru 
train_set_1D=vertcat(u1,train_set_1D);

% konvexna optimalizalia 
cvx_begin
variable w(n+1) % w hladana nadrovina, v nasom pripade hladane wahy 
% ucelova funkcia je z vaseho clanku , odkomentovana ucelova funkcia je zo
% stranky cvx, nie som si uplne isty tym log_sum_exp ale tak to maju aj na
% cvx strankach a nic ine som nevymyslel

%maximize(y_train'*uu*xx-sum(log_sum_exp([zeros(1,m); train_set_1D'*uu'])))
minimize((w'*train_set_1D)*(ones(m,1)-y_train) +sum(log_sum_exp([zeros(1,m); -w'*train_set_1D])))

cvx_end

%optimalne wahy mi vysli 
%  w1= -0.0987
 %  w2= 0.4165
%vykreslenie dat a priamky
x = linspace(-10,10,100);
y = w(1)+x*w(2);
plot(X(1,:),X(2,:),'o')
hold on
plot(Y(1,:),Y(2,:),'+')
hold on
plot(x,y)
