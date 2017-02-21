function Yd = stmPredictInnerProduct(stm, Xt)

% parameters
cathe = 10e+6;                
nx = size(stm.x,1);           
nt = size(Xt,1);              
block = ceil(nx*nt/cathe);    
num = ceil(nt/block);          

for i = 1:block
    if (i==block)
        index = (i-1)*num+1 : nt;
    else
        index = (i-1)*num+1 : num;
    end

    Yd(index) = svmSim_block(stm,Xt(index,:,:,:));         
end
end

% ------------------------------------------------------------%

function Yd = svmSim_block(stm,Xt)


X = stm.x;
Y = stm.y;
a = stm.a;

% test output
epsilon = 1e-8;                 
i_sv = find(abs(a)>epsilon);         
      
tmp = (a.*Y)*productAll(X,X(i_sv,:,:,:));         
b = Y(i_sv)-tmp;
b = mean(b);
tmp =  (a.*Y)*productAll(X,Xt);
tmp = tmp+b;
Yd = sign(tmp);
end

