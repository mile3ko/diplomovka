function matica3D = vector2image(v,x,y)

% rozmery matice


for i=1:x
     for j=1:y
         matica3D(i,j,:)=v((i-1)*x*3+(j-1)*3+1:(i-1)*x*3+(j-1)*3+3);
     end
     
end
matica3D=matica3D*255;% odnormalizacia dat rozmer 64x64x3
end