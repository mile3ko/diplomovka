% logisticka regresia pomocou cvx
%rozmery
m=m_train;
n=x*y*z;
% vytvorenie labelu pre jednotlive skupiny
y1=ones(100,1);
y2=zeros(100,1);
y_train = vertcat(y1,y2);
% jednotkovy vektor kvoli biasu
u1=ones(1,200);
xx=vertcat(u1,train_set_1D);


cvx_begin
variable w(n+1) 

% funkcia zwebu cvx
%maximize(w'*xx*y_train-sum(log_sum_exp([zeros(1,m); w'*xx])))  

% nasa funkcia
minimize((w'*xx)*(ones(m,1)-y_train) +sum(log_sum_exp([zeros(1,m); -w'*xx])))

cvx_end