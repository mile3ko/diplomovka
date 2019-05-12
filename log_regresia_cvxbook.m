% Generate data
a =  1;
b = -5 ;
m= 100;

u = 10*rand(m,1);
yy = (rand(m,1) < exp(a*u+b)./(1+exp(a*u+b)));
plot(u,yy,'o')
axis([-1,11,-0.1, 1.1]);

% Solve problem
%
% minimize  -(sum_(y_i=1) ui)*a - b + sum log (1+exp(a*ui+b)

U = [ones(m,1) u];
cvx_expert true
cvx_begin
    variables xa(2)
    maximize(yy'*U*xa-sum(log_sum_exp([zeros(1,m); xa'*U'])))

    cvx_end


% Plot results and logistic function

ind1 = find(yy==1);
ind2 = find(yy==0);

aml = xa(2);  bml = xa(1);
us = linspace(-1,11,1000)';
ps = exp(aml*us + bml)./(1+exp(aml*us+bml));

dots = plot(us,ps,'-', u(ind1),yy(ind1),'o',...
     u(ind2),yy(ind2),'o');

