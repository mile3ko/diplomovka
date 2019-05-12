function [spravne] = spravnost(X,Y,w,b,m)
   a_fin=vectsigmoid(X,w,b);
    odhad_a=zeros(1,m); 
    odhad_a=round(a_fin);
    

 nespravne= sum(abs(odhad_a-Y));
spravne=1-(nespravne/m);
spravne;       
end