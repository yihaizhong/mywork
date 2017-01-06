function [ normalizedFeatures ] = tensorNormalizeByParam( windowFeatures, meanFeature, stdFeature )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
    [n, xdim, ydim, zdim] = size(windowFeatures);
    normalizedFeatures = zeros(n, xdim, ydim, zdim);
    for i = 1:n
        tf(:, :, :) = windowFeatures(i, :, :, :);
        normalizedFeatures(i,:,:,:) = (tf - meanFeature) ./ stdFeature;
    end
end

