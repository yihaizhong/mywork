function [ c,rate ] = stmPredict( stm,x,label )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
w = stm.w;
b = stm.b;
wtx = x;
for i=1:3
    wi = cell2mat(w(i));
    wtx = ttv(wtx,wi,2);
end
wtx = double(wtx);
y = wtx+b;
c = sign(y);
n = length(label);
if n == 0
    rate = 'no label';
else
    correct_cnt = sum(c == label);
    crate = correct_cnt / n*100;
    rate = sprintf('%.2f%%',crate);
end
