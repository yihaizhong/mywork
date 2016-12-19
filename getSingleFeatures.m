function [ singleFeatures ] = getSingleFeatures( allBands )
%getSingleFeatures get features organized by each pixel
%   
[xdim, ydim, zdim] = size(allBands);
singleFeatures = zeros(xdim * ydim, zdim);
for i = 1:xdim
    singleFeatures((i - 1) * ydim + 1 : i * ydim, :) = allBands(i, :, :);
end

