function stm = stmTrainInnerProduct( X, Y, C )
%stmTrainInnerProduct 使用张量内积
%   
options = optimset;
options.LargeScale = 'off';
options.Display = 'off';


n = length(Y);
H = (Y'*Y).*productAll(X,X);

f = -ones(n,1);
A = [];
b = [];
Aeq = Y;
beq = 0;
lb = zeros(n,1);
ub = C*ones(n,1);
a0 = zeros(n,1);

[a,fval,eXitflag,output,lambda]  = quadprog(H,f,A,b,Aeq,beq,lb,ub,a0,options);   


eXitflag;

% output svm

stm.x = X;
stm.y = Y;
stm.a = a';
end
