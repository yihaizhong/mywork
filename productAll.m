function result = productAll( X, Y )
%   productAll like matrix product. just for 4d tensor, the first dimension
%   is length of the data
%   example: X:100x5x5x200, Y:50x5x5x200 result: 100x50
%   result(i, j) = <X(i,:,:,:),Y(j,:,:,:)>
%   
n1 = X.size(1);
n2 = Y.size(1);
%  check the size 


result = zeros(n1, n2);
%  inner product for all
for i = 1:n1
    for j = 1:n2
    result(i, j) = innerprod(X(i, :, :, :), Y(j, :, :, :));
    end
end
end

