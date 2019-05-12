% vykreslenie testovacich obrazkov (ako ich zaradila log reg)
    
a_fin2=vectsigmoid(test_set_1D,w,b);

%xx=vertcat(u1,test_set_1D);

label_test=[0,0,0,0,1,1,1,1,1,1,...
       1,0,1,1,1,1,0,0,1,1,...
       0,1,0,0,1,0,0,1,1,0,...
       0,0,0,1,1,1,1,1,0,1,...
       0,0,0,0,1,0,1,0,0,1,...
       1,1,1,1,1,0,0,1,0,1,...
       1,0,1,1,0,0,0,1,0,0,...
       0,0,0,0,1,0,0,0,0,1,...
       1,1,0,1,0,0,0,0,1,1,...
       1,1,1,0,0,1,0,0,1,1];
ind1 = find(label_test==1);
ind2 = find(label_test==0);


for i=1:50
    if label_test(i)==1 
        znak='o';
    else  znak='+';
        
    end
    plot(i,a_fin2(i),znak)
    odhad_a2(i)=round(a_fin2(i))
    hold on
end
nespravne= sum(abs(odhad_a2-label_test))
spravne=1-(nespravne/50)
