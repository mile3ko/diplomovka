function [spravne] = spravnost_c(a_fin,Y)
   
    [m,n]=size(Y);
    [bla,a_ind]=max(a_fin);
    
  odhad_a=zeros(m,n);
  for i=1:n
   odhad_a(a_ind(i),i)=1;
      
  end
  
  
 nespravne= sum(sum(abs(odhad_a-Y)));
spravne=1-(nespravne/(2*n));
      
end