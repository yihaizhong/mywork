% className=[1;5;7;9;11];
className = 1:16;
className = className';
classCnt = length(className);
train = [];
test = [];
trainLabels = [];
testLabels = [];
for i = 1:classCnt
    [ttrain, ttest] = getSingleTrainTestFeatures(pcaFeatures,labels,className(i),15);
    train = [train;ttrain];
    test = [test;ttest];
    trainLabels = [trainLabels;ones(size(ttrain,1),1) * className(i)];
    testLabels = [testLabels;ones(size(ttest,1),1) * className(i)];
end