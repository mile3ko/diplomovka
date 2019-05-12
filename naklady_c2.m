function [J]  = naklady_c2(Y,a2,m) % funkcia naklady
% zadefinovanie premennych
J=0;
%vypocet nakladovej funkcie

    
  J=sum(sum(Y.*log(a2)+(1-Y).*log(1-a2)));

J=-J/m;