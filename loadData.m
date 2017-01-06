% function [ output_args ] = STM( dataFile, labelFile )
%UNTITLED9 此处显示有关此函数的摘要
%   此处显示详细说明
dataFile = 'data.tif';
labelFile = 'label.tif';
allBands = loadAllBands(dataFile);
labels = loadLabels(labelFile);
allBands = double(allBands);
% allBands=(allBands-min(min(min(allBands)))) / (max(max(max(allBands)))-min(min(min(allBands))));
windowFeatures = getWindowFeatures(allBands, 3);
% [train1, test1] = getWindowTrainTestFeatures(windowFeatures, labels, 1, 15);
% trainLabel1 = ones(size(train1, 1),1);
% testLabel1 = ones(size(test1, 1),1);
% [train2, test2] = getWindowTrainTestFeatures(windowFeatures, labels, 2, 15);
% trainLabel2 = -ones(size(train2, 1),1);
% testLabel2 = -ones(size(test2, 1),1);
% train = [train1; train2];
% test = [test1; test2];
% trainLabel = [trainLabel1; trainLabel2];
% testLabel = [testLabel1; testLabel2];
% stm = stmTrain(tensor(train), trainLabel, 0.9);
% [c, rate] = stmPredict(stm, tensor(test), testLabel);
% rate
%end

