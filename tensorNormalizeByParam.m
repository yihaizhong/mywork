function [ normalizedFeatures ] = tensorNormalizeByParam( windowFeatures, meanFeature, stdFeature )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [n, xdim, ydim, zdim] = size(windowFeatures);
    normalizedFeatures = zeros(n, xdim, ydim, zdim);
    for i = 1:n
        tf(:, :, :) = windowFeatures(i, :, :, :);
        normalizedFeatures(i,:,:,:) = (tf - meanFeature) ./ stdFeature;
    end
end

