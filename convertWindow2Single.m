function [ singleFeatures ] = convertWindow2Single( windowFeatures )
%convertWindow2Single convert window features to single features by reshape
%   
[cnt, dimx, dimy, dimz] = size(windowFeatures);

ndim = dimx * dimy * dimz;
singleFeatures = zeros(cnt, ndim);
for i = 1:cnt
    singleFeatures(i, :) = reshape(windowFeatures(i, :, :, :),ndim, 1);
end

