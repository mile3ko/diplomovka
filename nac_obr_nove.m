m_train=200;  % velkost trenovacej vzorky
m_test=50;    % velkost testovacej vzorky
rozmer=64;    % rozmer obrazka  v pixeloch
train_set=zeros(rozmer^2,3,m_train);      % vytvorenie prazdnej 3D matice
test_set=zeros(rozmer^2,3,m_test);
train_set_1D=zeros(rozmer^2*3,m_train);   % vytvorenie prazdnej 2D matice
test_set_1D=zeros(rozmer^2*3,m_test);

%lanacitanie obrazkov maciek do train_set
for k=1:m_train-100
%nacitania obrazkov ako matic
name=['macka.',int2str(k-1),'.jpg']; 
A=imread(name); % nacitanie obrazku
[x,y,z]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3

% transformacia 3D matice do  2D 
 for i=1:x
     for j=1:y
         train_set(x*(i-1)+j,:,k)=B(i,j,:); 
     end
     
 end
 % transformacia 3D matice do  1D , kde jednotlive farebne zlozky RGB
 % kazdeho pixla  su 3 za sebou iduce prvky
 
         train_set_1D(:,k)=image2vector(A);
     
     
 
end

%nacitanie obrazkov psov do train_set
for k=1:m_train-100
%  nacitania obrazkov ako matic
name=['pes.',int2str(k-1),'.jpg']; 
A=imread(name); % nacitanie obrazku
[x,y,z]=size(A); % rozmery matice
B=double(A)/255; % normalizacia dat rozmer 64x64x3
% transformacia 3D matice do  2D 
 for i=1:x
     for j=1:y
         train_set(x*(i-1)+j,:,k+100)=B(i,j,:);
     end
     
 end
 % transformacia 3D matice do  1D
 
         
         train_set_1D(:,k+100)=image2vector(A);
     
     

end

%nacitanie obrazkov testovacich obrazkov do test_set
for k=1:m_test
%  nacitania obrazkov ako matic
name=['test.',int2str(k),'.jpg']; 
A=imread(name); % nacitanie obrazku
[x,y,z]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3
% transformacia 3D matice do  2D 
 for i=1:x
     for j=1:y
         test_set(x*(i-1)+j,:,k)=B(i,j,:);
     end
     
 end
 % transformacia kazdeho obrazku do 1D aby sme mohli robit logisticku
% regresiu
% transformacia 3D matice do  1D
 
         test_set_1D(:,k)=image2vector(A);
     
     
 
 
end


