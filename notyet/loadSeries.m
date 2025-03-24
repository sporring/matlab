function I = loadSeries(srcPath,filePattern,VERBOSE)
% LOADSERIES load a sequence of images
%
% Syntax
%   I = loadSeries(srcPath,filePattern)
%
% Arguments
%   I - a 3D images
%   srcPath - the path to a directory containing a sequence of same-size and format 2D images
%   filePattern - the file pattern in src to read in lexicographical order
%   VERBOSE - optional verbose flag. If true, then will show a waitbar window
%
% Read a series of images in lexicographical order and return as a 3D
% image.
%
% 2025/03/18, Jon Sporring

if nargin < 3
    VERBOSE = false;
end
lst = dir(fullfile(srcPath,filePattern));
[~,ind]=sort({lst.name});
I = imread(fullfile(lst(1).folder,lst(1).name));
I = repmat(I,[1,1,length(lst)]);
if VERBOSE
    f = waitbar(0,"loadSeries: Reading images");
end
for i = 1:length(lst)
    I(:,:,i) = imread(fullfile(lst(ind(i)).folder,lst(ind(i)).name));
    if VERBOSE
       waitbar(i/length(lst),f,"loadSeries: Reading images")
    end
end
