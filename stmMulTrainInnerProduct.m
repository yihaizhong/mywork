function [ stmm ] = stmMulTrainInnerProduct( X, Y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
class_m=unique(Y);
class_cnt=length(class_m);
%[train_cnt,dim_x,dim_y,dim_z]=X.size;
% [index_set,start_set]=group(Y,class_m);
%stmm=struct(class_cnt, class_cnt - 1);
for i = 1:class_cnt-1
    for j = i + 1:class_cnt
%           i=1;j=6;
        indexi = find(Y == class_m(i));
        indexj = find(Y == class_m(j));
        yij=[ones(length(indexi),1);-ones(length(indexj),1)];
        ci=X(indexi,:,:,:);
%         ci=double(ci);
        cj=X(indexj,:,:,:);
%         cj=double(cj);
        cij=[double(ci);double(cj)];
%         cij=tensor(cij);gauss
%         ker = struct('type','linear');
        i,j
        C=200;
%         bestC = getBestC(cij, yij)

        stmm.stm(i,j)=stmTrainInnerProduct(tensor(cij),yij',C);
    end
end
stmm.X=X;
stmm.Y=Y;
stmm.class_m=class_m;
stmm.class_cnt=class_cnt;
end

