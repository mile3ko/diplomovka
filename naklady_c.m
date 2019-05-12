function [J]  = naklady_c(Y,a2,m) % funkcia naklady
% zadefinovanie premennych
J=0;
%vypocet nakladovej funkcie
for i=1:m
    
  J=J+(Y(i)*log(a2(i))+(1-Y(i))*log(1-a2(i)));
end
J=-J/m;

 end