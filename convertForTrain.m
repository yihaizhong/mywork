function [ windowFeatures ] = convertForTrain( mpcaResult )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
t = size(mpcaResult);
% [xdim, ydim, zdim, cnt] = t(1, :);
windowFeatures = zeros(t(4), t(1), t(2), t(3));
for i = 1:t(4)
    windowFeatures(i, :, :, :) = mpcaResult(:, :, :, i);
end

end

