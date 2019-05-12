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
