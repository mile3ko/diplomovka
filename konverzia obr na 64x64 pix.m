%konverzia_obrazkov zo suboru train na 64x64 pixelov

for i= 0:199
 name=['cat.', int2str(i),'.jpg'] 
I1=imread(name);
In = imresize(I1,[64 64]); 
%figure;imshow(In);
meno=['macka.', int2str(i),'.jpg']
imwrite(In,meno) ;
end

for i= 0:199
 name=['dog.', int2str(i),'.jpg'] 
I1=imread(name);
In = imresize(I1,[64 64]); 
%figure;imshow(In);
meno=['pes.', int2str(i),'.jpg']
imwrite(In,meno) ;
end


%konverzia_obrazkov zo suboru test na 64x64 pixelov
%{
for i= 1:50
name=[int2str(i),'.jpg'] 
I1=imread(name);
In = imresize(I1,[64 64]); 
%figure;imshow(In);
meno=['test.', int2str(i),'.jpg']
imwrite(In,meno) ;
end
%}