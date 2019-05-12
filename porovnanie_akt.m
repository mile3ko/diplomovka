xx=(-3:0.01:3.01);
y= tanh(xx);
plot(xx,y)
hold on
y=1./(1+(exp(-xx)));
plot(xx,y);
hold on
y=max(0,xx)
plot(xx,y)
y1=zeros(length(xx)/2,1);
y2=ones(length(xx)/2,1);
y=vertcat(y1,y2);
plot(xx,y,'--')
axis([-3 3 -1.1 1.1])
xlabel('x')
ylabel('y')
legend('tanh','sigmoid','ReLu','perceptrón')

