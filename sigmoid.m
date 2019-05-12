function [s] = sigmoid(a)

for i=1:length(a)
    s(i)=1/(1+exp(-a(i)));
end
s
end
