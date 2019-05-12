function [J,dJdw,dJdb]  = naklady(X,Y,w,b) % funkcia naklady
% zadefinovanie premennych
J=0;
dJdw=0;
dJdb=0;

m=length(X(1,:)); % dlzka vektora w kvoli cyklu na vypocet J
[a,da]=vectsigmoid(X,w,b);
%vypocet nakladovej funkcie
for i=1:m
  
 J=J+(Y(i)*log(a(i))+(1-Y(i))*log(1-a(i)));
 
end
J=-J/m;
%vypocet gradientu
 dJdw= X*(a-Y)'./m;
 dJdb= sum(a-Y)/m;
 J;
 dJdw;
 dJdb;
 end