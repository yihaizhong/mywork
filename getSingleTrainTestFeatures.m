function [ train, test ] = ...
getSingleTrainTestFeatures( allFeatures, labels, classNo, trainCount )
% getSingleTrainTestFeatures
%  allFeatures : n x p mat
%  labels : n x 1
%  classNo : 
%  trainCount : number of train data
index = find(labels == classNo);
n = length(index);
nindex = randperm(n);
trainIndex = nindex(1:trainCount);
testIndex = nindex(trainCount + 1:n);
train = allFeatures(index(trainIndex), :);
test = allFeatures(index(testIndex), :);
end

