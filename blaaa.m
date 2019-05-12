Y=[0,0,1,0;1,0,0,0]';
a_fin=[0.1,0.4,0.99,0;0.8,0.2,0.1,0]';


 [m,n]=size(Y);
    [bla,a_ind]=max(a_fin);
    
  odhad_a=zeros(m,n);
  for i=1:n
   odhad_a(a_ind(i),i)=1;
      
  end
  
  
 nespravne= sum(sum(abs(odhad_a-Y)));
spravne=1-(nespravne/m);