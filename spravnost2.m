function [spravne] = spravnost2(a_fin,Y,m)
   
    odhad_a=zeros(1,m); 
    odhad_a=round(a_fin);
    

 nespravne= sum(abs(odhad_a-Y));
spravne=1-(nespravne/m);
spravne;       
end