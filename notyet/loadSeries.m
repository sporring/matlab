function I = loadSeries(srcPath,filePattern)
% LOADSERIES load a sequence of images
%
% srcPath - the path to a directory containing a sequence of same-size and format 2D images
% filePattern - the file pattern in src to read in lexicographical order
% I - a 3D images
%
% Read a series of images in lexicographical order and return as a 3D
% image.
%
% 2025/03/18, Jon Sporring

lst = dir(fullfile(srcPath,filePattern));
[~,ind]=sort({lst.name});
I = imread(fullfile(lst(1).folder,lst(1).name));
I = repmat(I,[1,1,length(lst)]);
for i = 1:length(lst)
    I(:,:,i) = imread(fullfile(lst(ind(i)).folder,lst(ind(i)).name));
end
