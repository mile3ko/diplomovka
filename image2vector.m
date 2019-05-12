function obr_vector = image2vector(A)

[x,y,z]=size(A); % rozmery matice
B=double(A)/255;% normalizacia dat rozmer 64x64x3

for i=1:x
     for j=1:y
         obr_vector((i-1)*x*3+(j-1)*3+1:(i-1)*x*3+(j-1)*3+3)=B(i,j,:);
     end
     
end
end