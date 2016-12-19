function [ windowFeatures ] = getWindowFeatures( allBands, windowSize )
%getWindowFeatures 
%   
r = floor(windowSize / 2);
[xdim, ydim, zdim] = size(allBands);
newAllBands=[allBands(:, 1:r, :), allBands, allBands(:, end - r + 1:end, :)];
newAllBands=[newAllBands(1:r, :, :); newAllBands; newAllBands(end - r + 1:end, :, :)];
windowFeatures = zeros(xdim * ydim, windowSize, windowSize, zdim);
k = 1;
for i = r + 1:xdim + r
    for j = r + 1:ydim + r
        windowFeatures(k, :, :, :) = newAllBands(i - r: i + r, j - r:j + r, :);
        k = k + 1;
    end
end
end

