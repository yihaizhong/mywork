function [ normalizedFeatures, meanFeature, stdFeature ] = tensorNormalize( windowFeatures )
    [n, xdim, ydim, zdim] = size(windowFeatures);
    sumFeature = zeros(xdim, ydim, zdim);
    normalizedFeatures = zeros(n, xdim, ydim, zdim);
    for i = 1:n
        tf(:, :, :) = windowFeatures(i, :, :, :);
        sumFeature = sumFeature + tf;
    end
    
    meanFeature = sumFeature / n;
    
    stdFeature = zeros(xdim, ydim, zdim);
    
    for i = 1:n
        tf(:, :, :) = windowFeatures(i, :, :, :);
        stdFeature = stdFeature + (tf - meanFeature) .* (tf - meanFeature);
    end
    stdFeature = (stdFeature / n).^0.5;
    
    for i = 1:n
        tf(:, :, :) = windowFeatures(i, :, :, :);
        normalizedFeatures(i,:,:,:) = (tf - meanFeature) ./ stdFeature;
    end
    
end

