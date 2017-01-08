function [ svmm ] = svmMulTrain( X, Y)
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
        ci=X(indexi,:);
%         ci=double(ci);
        cj=X(indexj,:);
%         cj=double(cj);
        cij=[ci;cj];
%         cij=tensor(cij);gauss
%         ker = struct('type','linear');
        ker = struct('type','gauss');
        ker.width = 16;
        i,j
        C=200;
%         bestC = getBestC(cij, yij)

        svmm.svm(i,j)=svmTrain('svc_c',cij',yij',ker,C);
    end
end
svmm.X=X;
svmm.Y=Y;
svmm.class_m=class_m;
svmm.class_cnt=class_cnt;
end

function bestC = getBestC(trainSet, trainLabels)
    n = length(trainLabels);
    halfIndex = n / 2;
    trainCount = ceil(n * 2 / 3) / 2;
%     testCount = n - trainCount;
    
    subTrainSet = tensor([double(trainSet(1:trainCount, :, :, :)); ...
                    double(trainSet(halfIndex + 1 :halfIndex + trainCount, :, :, :))]);
    subTrainLabels = [trainLabels(1:trainCount);trainLabels(halfIndex + 1:halfIndex + trainCount)];
    
    subTestSet = tensor([double(trainSet(trainCount + 1 : halfIndex, :, :, :)); ...
                    double(trainSet(halfIndex + trainCount + 1 : n, :, :, :))]);
    subTestLabels = [trainLabels(trainCount + 1 :halfIndex);trainLabels(halfIndex + trainCount + 1 : n)];
     
    bestC = 0;
    bestPredict = 0;
    
    for i = -5:5
        C = 10^i;
        stm = stmTrain(subTrainSet, subTrainLabels, C);
        [~, crate] = stmPredict(stm, subTestSet, subTestLabels);
        if(crate > bestPredict)
            bestPredict = crate;
            bestC = C;
        end
    end
end
% function [index_set,start_set] = group( Y, class_m )
% index_set=zeros(length(Y),1);
% start_set=zeros(length(class_m),1);
% start_set(1)=1;
% k=1;
% for i=1:length(class_m)
%     indexi = find(Y==class_m(i));
%     cnti=length(indexi);
%     index_set(k:k+cnti-1,:)=indexi;
%     k=k+cnti;
%     start_set(i+1)=k;
% end
% end

