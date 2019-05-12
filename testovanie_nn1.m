a_fin=vectsigmoid(X,w,b);
J
plot(1:100,a_fin(1:100),'o')
hold on
plot(101:200,a_fin(101:200),'x')

for i=1:200
    
    odhad_a(i)=round(a_fin(i));
    hold on
end
nespravne= sum(abs(odhad_a-Y));
spravne=1-(nespravne/200);
spravne