function[X_train,X_test,X_val,Y_train,Y_test,Y_val]=nac_obr_cis_far(m_train,m_test,m_val) 


%train_set_1D=zeros(rozmer^2*3,m_train);   % vytvorenie prazdnej 2D matice
%test_set_1D=zeros(rozmer^2*3,m_test);

load('M:\DP\zadanie1\skonvertovane_obrazky\train_32x32.mat'); % nacitanie trenovacich dat
Y_train=y(1:m_train);

%%%%%% trenovacia sadaclear
%nacitanie obrazkov maciek do train_set
for k=1:m_train
    
    if Y_train(k)==10;
      Y_train(k)=0;
       end
    
    
    A=X(:,:,:,k);
%nacitania obrazkov ako matic
[r1,r2,r3]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3


 % transformacia 3D matice do  1D , kde jednotlive farebne zlozky RGB
 % kazdeho pixla  su 3 za sebou iduce prvky
 for i=1:r1
     for j=1:r2
         train_set_1D((i-1)*r1*3+(j-1)*3+1:(i-1)*r1*3+(j-1)*3+3,k)=B(i,j,:);
     end
     
 end
end

%%%%%%%%%%%  nac validacnej sady
load('M:\DP\zadanie1\skonvertovane_obrazky\train_32x32.mat'); % nacitanie trenovacich dat
Y_val=y(m_train+1:m_train+m_val);

%%%%%% trenovacia sada
%nacitanie obrazkov maciek do train_set
for k=1:m_val
    
    if Y_val(k)==10;
      Y_val(k)=0;
       end
    
    
    A=X(:,:,:,k+m_train);
%nacitania obrazkov ako matic
[r1,r2,r3]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3


 % transformacia 3D matice do  1D , kde jednotlive farebne zlozky RGB
 % kazdeho pixla  su 3 za sebou iduce prvky
 for i=1:r1
     for j=1:r2
         X_val((i-1)*r1*3+(j-1)*3+1:(i-1)*r1*3+(j-1)*3+3,k)=B(i,j,:);
     end
     
 end
end

%%%%%%%%%%% nacitanie testovacich obr
%macky do train_set
load('M:\DP\zadanie1\skonvertovane_obrazky\test_32x32.mat'); % nacitanie trenovacich dat
Y_test=y(1:m_test);
for k=1:m_test
    
    if Y_test(k)==10;
      Y_test(k)=0;
       end
    
    
    A=X(:,:,:,k);
%nacitania obrazkov ako matic
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

X_train=train_set_1D;
X_test=test_set_1D;
%writetable(array2table(test_set_1D),'test_set_1D.xlsx')
%writetable(array2table(train_set_1D),'train_set_1D.xlsx')
