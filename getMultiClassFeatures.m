className = 1:16;
className = className';
% className=[1;5;7;9;11];
classCnt = length(className);
train = [];
test = [];
trainLabels = [];
testLabels = [];
allTest = [];
allLabels = [];

for i = 1:classCnt
    [ttrain, ttest, tAll] = getWindowTrainTestFeatures(windowFeatures,labels,className(i),15);
    train = [train;ttrain];
    test = [test;ttest];
    allTest = [allTest;tAll];
    trainLabels = [trainLabels;ones(size(ttrain,1),1) * className(i)];
    testLabels = [testLabels;ones(size(ttest,1),1) * className(i)];
    allLabels = [allLabels;ones(size(tAll,1),1) * className(i)];
end
