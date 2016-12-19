function [ labels ] = loadLabels( path )
%loadLabels load labels from path
%  
labels = imread(path);
[xdim, ydim] = size(labels);
nlabels = zeros(xdim * ydim, 1);

for i = 1:xdim
    nlabels((i - 1) * ydim + 1 : i * ydim) = labels(i, :);
end

labels = nlabels;

end
