function stm = stmTrain(X,Y,C)
%STMTRAIN 
% STM Classification:
%   stm = stmTrain(x,y,C); 
%   X : n x ... tensor
%   Y : n x 1 labels
%   C : soft 
% STM Regression:
%   stm = stmTrain(x,y,C); 
%% initialize
options = optimset;
options.LargeScale = 'off';
options.Display = 'off';

Y = Y';%for quadprog
n = length(Y);
w1 = rand(X.size(2), 1);
w2 = rand(X.size(3), 1);
w3 = rand(X.size(4), 1);

w = {w1/norm(w1); w2/norm(w2); w3/norm(w3)};

a_all = zeros(n, 3);
wnew = w;
fmin = 1000;
maxk = 500;
itk=1;
%% get wj by iteration
while itk < maxk
    for j = 1:3
       
       yita = 1;
       XX = X;
       mode = 2;
       for i = 1:3
           if i == j
               mode = mode + 1;
               continue;
           end
           wi = cell2mat(wnew(i));
           yita = yita * (wi'*wi);
           
           XX = ttv(XX,wi,mode);
       end
       XX = double(XX);
       XX = XX';
       H =  (Y'*Y).*(XX'*XX) / yita ;
       f = -ones(n,1);
       A = [];
       b = [];
       Aeq = Y;
       beq = 0;
       lb = zeros(n,1);
       ub = C*ones(n,1);
       a0 = zeros(n,1);
       [a, fval, eXitflag, output, lambda]  = quadprog(H, f, A, b, Aeq, beq, lb, ub, a0, options);
       a_all(:,j) = a(:);
       wj = 0;
       for i = 1:n
           wj = wj + 1 / yita * a(i) * Y(i) * XX(:,i);
       end
       wnew(j) = mat2cell(wj,length(wj));
    end
    %% check condition of terminnation
    sum = 0;
    for j = 1:3
        wj = cell2mat(wnew(j));
        wj_old = cell2mat(w(j));
        sum = sum + (wj'*wj_old) / (wj'*wj)-1;
    end
    
    w = wnew;
    itk = itk+1;
    sum
    if abs(sum) < 1e-4
        break;
    end
    if fval < fmin
        tw = w;
        tbest =a_all;
        fmin = fval;
    end
end
if itk == maxk
    a_all = tbest;
    wnew = tw;
    'no best'
end
%% get b
ep=1e-10;
stm1 = find(a_all(:,1)>=ep);
stm2 = find(a_all(:,2)>=ep);
stm3 = find(a_all(:,3)>=ep);
stm_index = intersect(stm1,stm2);
stm_index = intersect(stm_index,stm3);

if length(stm_index) > 1
stm_tensor = X(stm_index,:,:,:);
tY = Y';
stm_label = tY(stm_index);
    
for j = 1:3
    wj = cell2mat(wnew(j));
    stm_tensor = ttv(stm_tensor, wj, 2);
end

wtx = double(stm_tensor);
b = mean(stm_label-wtx);
else
    b = 0;
end
%% output stm

stm.x = X;
stm.y = Y;
stm.w = wnew;
stm.a = a_all;
stm.c = C;
stm.b = b;
'success'
end

