% vykreslenie testovacich obrazkov (ako ich zaradila log reg)
    [a1,a2,Z1,Z2]=f_prop(test_set_1D,W1,W2,b1,b2,m_test)
a_fin2=a2

%xx=vertcat(u1,test_set_1D);

label=[0,0,0,0,1,1,1,1,1,1,...
       1,0,1,1,1,1,0,0,1,1,...
       0,1,0,0,1,0,0,1,1,0,...
       0,0,0,1,1,1,1,1,0,1,...
       0,0,0,0,1,0,1,0,0,1];
ind1 = find(label==1);
ind2 = find(label==0);


for i=1:50
    if label(i)==1 
        znak='o';
    else  znak='+';
        
    end
    plot(i,a_fin2(i),znak)
    odhad_a2(i)=round(a_fin2(i))
    hold on
end
nespravne= sum(abs(odhad_a2-label))
spravne=1-(nespravne/50)
