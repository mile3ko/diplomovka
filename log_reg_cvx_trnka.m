%generovanie dat
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


m=100;
n=1;
% label
y1=ones(50,1);
y2=zeros(50,1);
y_train = vertcat(y1,y2);
% jednotkovy vektor
u1=ones(1,100);
train_set_1D= horzcat(Y(2,:),X(2,:))
xx=vertcat(u1,train_set_1D);


cvx_begin
variable w(n+1) 

%maximize(y_train'*uu*xx-sum(log_sum_exp([zeros(1,m); xx'*uu'])))
minimize((w'*xx)*(ones(m,1)-y_train) +sum(log_sum_exp([zeros(1,m); -w'*xx])))

cvx_end
%vykreslenie dat a priamky
x = linspace(-10,10,100);
y = w(1)+x*w(2);
plot(X(1,:),X(2,:),'o')
hold on
plot(Y(1,:),Y(2,:),'+')
hold on
plot(x,y)
