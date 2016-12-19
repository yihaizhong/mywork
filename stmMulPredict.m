function [ c,rate ] = stmMulPredict( stmm,x,label )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
class_cnt=stmm.class_cnt;
class_m=stmm.class_m;
stm=stmm.stm;
score=zeros(x.size(1),class_cnt);
for i=1:class_cnt-1
    for j=i+1:class_cnt
        if j == i
            continue;
        end
        is_reverse=0;
        if j > i
            stmij=stm(i,j);
        else
            stmij=stm(j,i);
            is_reverse=1;
        end
    
        w=stmij.w;
        b=stmij.b;
        wtx=x;
        for k=1:3
            wk=cell2mat(w(k));
            wtx=ttv(wtx,wk,2);
        end
        wtx=double(wtx);
        yij=wtx+b;
        if is_reverse == 1
            yij=-yij;
        end
%         pt=1./(1.+exp(yij));
        pv=sign(yij);
        score(pv>0,i)=score(pv>0,i) + 1;
        score(pv<0,j)=score(pv<0,j) + 1;
    end
end
[~,index_i]=max(score,[],2);
c=class_m(index_i);
n=length(label);
if n == 0
    rate = 'no label';
else
    correct_cnt=sum(c==label);
    crate=correct_cnt/n*100;
    rate=sprintf('%.2f%%',crate);
end

end

