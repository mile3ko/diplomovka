% vykreslenie trenovacich bodov (ako ich zaradila log reg)

for i=1:100
    plot(i,1/(1+exp(-xx(:,i)'*w)),'o')
    lr(i)=1/(1+exp(-xx(:,i)'*w));
    hold on
end
    

    for i=101:200
    plot(i,1/(1+exp(-xx(:,i)'*w)),'+')
    lr(i)=1/(1+exp(-xx(:,i)'*w));
    hold on
end
    lr
    