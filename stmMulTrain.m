function [ stmm ] = stmMulTrain( X, Y, C)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
class_m=unique(Y);
class_cnt=length(class_m);
%[train_cnt,dim_x,dim_y,dim_z]=X.size;
[index_set,start_set]=group(Y,class_m);
%stmm=struct(class_cnt, class_cnt - 1);
for i = 1:class_cnt-1
    for j = i + 1:class_cnt
    indexi=index_set(start_set(i):start_set(i+1)-1);
    indexj=index_set(start_set(j):start_set(j+1)-1);
    ci=X(indexi,:,:,:);
    ci=double(ci);
    cj=X(indexj,:,:,:);
    cj=double(cj);
    cij=[ci;cj];
    cij=tensor(cij);
    yi=Y(indexi);
    yi(:)=1;
    yj=Y(indexj);
    yj(:)=-1;
    yij=[yi;yj];
    stmm.stm(i,j)=stmTrain(cij,yij,C);
    end
end
stmm.X=X;
stmm.Y=Y;
stmm.class_m=class_m;
stmm.class_cnt=class_cnt;
end

function [index_set,start_set] = group( Y, class_m )
index_set=zeros(length(Y),1);
start_set=zeros(length(class_m),1);
start_set(1)=1;
k=1;
for i=1:length(class_m)
    indexi = find(Y==class_m(i));
    cnti=length(indexi);
    index_set(k:k+cnti-1,:)=indexi;
    k=k+cnti;
    start_set(i+1)=k;
end
end