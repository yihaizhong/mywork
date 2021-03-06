c1 = 2;
c2 = 10;
[train1, test1] = getWindowTrainTestFeatures(windowFeatures, labels, c1, 15);
trainLabel1 = ones(size(train1, 1),1);
testLabel1 = ones(size(test1, 1),1);
[train2, test2] = getWindowTrainTestFeatures(windowFeatures, labels, c2, 15);
trainLabel2 = -ones(size(train2, 1),1);
testLabel2 = -ones(size(test2, 1),1);
train = [train1; train2];
test = [test1; test2];
trainLabel = [trainLabel1; trainLabel2];
testLabel = [testLabel1; testLabel2];
stm = stmTrain(tensor(train), trainLabel, 2^10);
[c, rate] = stmPredict(stm, tensor(test), testLabel);
rate