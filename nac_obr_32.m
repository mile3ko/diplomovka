function[X_train,X_test]=nac_obr_32(m_train,m_test,rozmer) 
train_set=zeros(rozmer^2,3,m_train);      % vytvorenie prazdnej 3D matice
test_set=zeros(rozmer^2,3,m_test);
train_set_1D=zeros(rozmer^2*3,m_train);   % vytvorenie prazdnej 2D matice
test_set_1D=zeros(rozmer^2*3,m_test);


%%%%%% trenovacia sada
%nacitanie obrazkov maciek do train_set
for k=1:m_train/2
%nacitania obrazkov ako matic
name=['M:\DP\zadanie1\skonvertovane_obrazky\32x32\train\macka.',int2str(k-1),'.jpg']; 
A=imread(name); % nacitanie obrazku
[r1,r2,r3]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3

% transformacia 3D matice do  2D 
 
 % transformacia 3D matice do  1D , kde jednotlive farebne zlozky RGB
 % kazdeho pixla  su 3 za sebou iduce prvky
 for i=1:r1
     for j=1:r2
         train_set_1D((i-1)*r1*3+(j-1)*3+1:(i-1)*r1*3+(j-1)*3+3,k)=B(i,j,:);
     end
     
 end
end
%nacitanie obrazkov psov do train_set
for k=1:m_train/2
%  nacitania obrazkov ako matic
name=['M:\DP\zadanie1\skonvertovane_obrazky\32x32\train\pes.',int2str(k-1),'.jpg']; 
A=imread(name); % nacitanie obrazku
[r1,r2,r3]=size(A); % rozmery matice
B=double(A)/255; % normalizacia dat rozmer 64x64x3

 % transformacia 3D matice do  1D
 for i=1:r1
     for j=1:r2
         
         train_set_1D((i-1)*r1*3+(j-1)*3+1:(i-1)*r1*3+(j-1)*3+3,k+m_train/2)=B(i,j,:);
     end
     
 end
end




%%%%%%%%%%% nacitanie testovacich obr
%macky do train_set
for k=1:m_test/2
%nacitania obrazkov ako matic
name=['M:\DP\zadanie1\skonvertovane_obrazky\32x32\train\macka.',int2str(k-1+12000),'.jpg']; 
A=imread(name); % nacitanie obrazku
[r1,r2,r3]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3


 
 % transformacia 3D matice do  1D , kde jednotlive farebne zlozky RGB
 % kazdeho pixla  su 3 za sebou iduce prvky
 for i=1:r1
     for j=1:r2
         test_set_1D((i-1)*r1*3+(j-1)*3+1:(i-1)*r1*3+(j-1)*3+3,k)=B(i,j,:);
     end
     
 end
end
%nacitanie obrazkov psov do train_set
for k=1:m_test/2
%  nacitania obrazkov ako matic
name=['M:\DP\zadanie1\skonvertovane_obrazky\32x32\train\pes.',int2str(k-1+12000),'.jpg']; 
A=imread(name); % nacitanie obrazku
[r1,r2,r3]=size(A); % rozmery matice
B=double(A)/255; % normalizacia dat rozmer 64x64x3
 
 % transformacia 3D matice do  1D
 for i=1:r1
     for j=1:r2
         
         test_set_1D((i-1)*r1*3+(j-1)*3+1:(i-1)*r1*3+(j-1)*3+3,k+m_test/2)=B(i,j,:);
     end
     
 end
end



%nacitanie  nahodnych obrazkov testovacich obrazkov do test_set
%{
for k=1:m_test
%  nacitania obrazkov ako matic
name=['M:\DP\zadanie1\skonvertovane_obrazky\test_full\test.',int2str(k),'.jpg']; 
A=imread(name); % nacitanie obrazku
[r1,r2,r3]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3
% transformacia 3D matice do  2D 
 for i=1:r1
     for j=1:r2
         test_set(r1*(i-1)+j,:,k)=B(i,j,:);
     end
     
 end
 % transformacia kazdeho obrazku do 1D aby sme mohli robit logisticku
% regresiu
% transformacia 3D matice do  1D
 for i=1:r1
     for j=1:r2
         test_set_1D((i-1)*r1*3+(j-1)*3+1:(i-1)*r1*3+(j-1)*3+3,k)=B(i,j,:);
     end
     
 end
 
end
%}
X_train=train_set_1D;
X_test=test_set_1D;
%writetable(array2table(test_set_1D),'test_set_1D.xlsx')
%writetable(array2table(train_set_1D),'train_set_1D.xlsx')
