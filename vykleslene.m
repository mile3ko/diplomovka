plot(sp_train)
hold on
plot(sp_val)

[a b]=max(sp_train)
[a b]=max(sp_val)
legend('trénovacia sada','validaèná sada')

plot(J_train)
hold on
plot(J_val)

[a,b]=min(J_train)
[a,b]=min(J_val)
legend('trénovacia sada','validaèná sada')

%plot(f2)
%hold on

[ q1(500) a]=max(sp_train)
[ q2(500) b]=max(sp_val)

