function [ pcaFeatures ] = getPcaFeatures( singleFeatures, t )
%getPcaFeatures 
%   
[~,score,latent,~,~]= pca(zscore(singleFeatures));
rate=cumsum(latent)./sum(latent);
pcaFeatures = score(:, rate < t);
end

