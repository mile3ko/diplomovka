m_train=200;
m_test=50;
train_set=zeros(64^2,3,m_train);
test_set=zeros(64^2,3,m_test);
train_set_1D=zeros(64^2*3,m_train);
test_set_1D=zeros(64^2*3,m_test);

%lanacitanie obrazkov maciek do train_set
for k=1:m_train-100
%nacitania obrazkov ako matic
name=['macka.',int2str(k-1),'.jpg'] 
A=imread(name); % nacitanie obrazku
[x,y,z]=size(A); % rozmery matice
B=double(A);
% normalizacia dat rozmer 64x64x3
% transformacia 3D matice do  2D 
 for i=1:x
     for j=1:y
         train_set(x*(i-1)+j,:,k)=B(i,j,:);
     end
     
 end
 % transformacia 3D matice do  1D
 for i=1:x
     for j=1:y
         train_set_1D((i-1)*x*3+(j-1)*3+1:(i-1)*x*3+(j-1)*3+3,k)=B(i,j,:);
     end
     
 end
end
%nacitanie obrazkov psov do train_set
for k=1:m_train-100
%  nacitania obrazkov ako matic
name=['pes.',int2str(k-1),'.jpg'] 
A=imread(name); % nacitanie obrazku
[x,y,z]=size(A); % rozmery matice
B=double(A);
% normalizacia dat rozmer 64x64x3
% transformacia 3D matice do  2D 

 for i=1:x
     for j=1:y
         train_set(x*(i-1)+j,:,k+100)=B(i,j,:);
     end
     
 end
 % transformacia 3D matice do  1D
 for i=1:x
     for j=1:y
         
         train_set_1D((i-1)*x*3+(j-1)*3+1:(i-1)*x*3+(j-1)*3+3,k+100)=B(i,j,:);
     end
     
 end
end
%nacitanie obrazkov testovacich obrazkov do test_set
for k=1:m_test
%  nacitania obrazkov ako matic
name=['test.',int2str(k),'.jpg'] 
A=imread(name); % nacitanie obrazku
[x,y,z]=size(A); % rozmery matice
B=double(A);% normalizacia dat rozmer 64x64x3
% transformacia 3D matice do  2D 
 for i=1:x
     for j=1:y
         test_set(x*(i-1)+j,:,k)=B(i,j,:);
     end
     
 end
 % transformacia kazdeho obrazku do 1D aby sme mohli robit logisticku
% regresiu
% transformacia 3D matice do  1D
 for i=1:x
     for j=1:y
         test_set_1D((i-1)*x*3+(j-1)*3+1:(i-1)*x*3+(j-1)*3+3,k)=B(i,j,:);
     end
     
 end
 
end

m=m_train;
n=x*y*z;
y1=ones(100,1);
y2=zeros(100,1);
y_train = vertcat(y1,y2);
u1=ones(1,200);
u=vertcat(u1,train_set_1D);
sucet=0;
V=0;
cvx_begin
variable xx(n+1)
min V
subject to
for i=1:200
V=V+((1-y_train(i))*xx'*u(:,i)+log(1+exp(-xx'*u(:,i))))
end
cvx_end


for i=1:100
    plot(i,1/(1+exp(-xx'*u(:,i))),'o')
    lr(i)=1/(1+exp(-xx'*u(:,i)));
    hold on
end
    

    for i=101:200
    plot(i,1/(1+exp(-xx'*u(:,i))),'+')
    lr(i)=1/(1+exp(-xx'*u(:,i)));
    hold on
end
    xx'*u