k=1;
for i = 1:16
    for j = i+1:16
%         c1=2
%         c2=3
[train1, test1] = getSingleTrainTestFeatures(pcaFeatures, labels, c1, 15);
trainLabel1 = ones(size(train1, 1),1);
testLabel1 = ones(size(test1, 1),1);
[train2, test2] = getSingleTrainTestFeatures(pcaFeatures, labels, c2, 15);
trainLabel2 = -ones(size(train2, 1),1);
testLabel2 = -ones(size(test2, 1),1);
train = [train1; train2];
test = [test1; test2];
trainLabel = [trainLabel1; trainLabel2];
testLabel = [testLabel1; testLabel2];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%功能：演示SVM算法在计算机视觉中的应用
%基于SVM实现特征分类；
%环境：Win7，Matlab2012b
%Modi: NUDT-VAP
%时间：2013-09-23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% kernel function
C = 200;               
% ker = struct('type','linear');
ker = struct('type','gauss');
        ker.width = 16;
% test sample
% n = 50;
% randn('state',6);
% x1 = randn(2,n);
% y1 = ones(1,n);
% x2 = 5+randn(2,n);
% y2 = -ones(1,n);

% figure(1);
% plot(x1(1,:),x1(2,:),'bx',x2(1,:),x2(2,:),'k.');
% axis([-3 8 -3 8]);
% title('C-SVC')
% hold on;
% 
% X = [x1,x2];       
% Y = [y1,y2];      

% train SVM
svm = svmTrain('svc_c',train',trainLabel',ker,C);


% find sustain vector
a = svm.a;
epsilon = 1e-8;                     
i_sv = find(abs(a)>epsilon);        
% plot(X(1,i_sv),X(2,i_sv),'ro');


% test output
% [x1,x2] = meshgrid(-2:0.1:7,-2:0.1:7);
% [rows,cols] = size(x1);
% nt = rows*cols;                 
% Xt = [reshape(x1,1,nt);reshape(x2,1,nt)];

Yd = svmSim(svm,test');  
correct_cnt = sum(Yd == testLabel');
crate(k) = correct_cnt / length(testLabel)*100;
rate = sprintf('%.2f%%',crate(k))
k = k+1;
    end
end
% Yd = reshape(Yd,rows,cols);
% contour(x1,x2,Yd,[0 0],'m');   