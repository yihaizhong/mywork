function [ nAllFeatures ] = convertForMpca( allFeatures )
%convertForMpca3 
%   
[cnt, xdim, ydim, zdim] = size(allFeatures);
nAllFeatures = zeros(xdim, ydim, zdim, cnt);
for i = 1:cnt
    nAllFeatures(:, :, :, i) = allFeatures(i, :, :, :);
end

