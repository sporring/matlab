function saveSeries(I,dstPath,name,ext)
% SAVESERIES load a sequence of images
%
% Syntax
%   saveSeries(I,dstPath,name,ext)
%
% Arguments
%   I - a 3D volume image
%   dstPath - the destination folder
%   name - base of the resulting 2d filenames
%   ext - filename extension, e.g., 'tif'
%
% Write a 3D image as a sequence of 2D images using imwrite. The 2D images
% will be named <name>01.<ext>, <name>02.<ext>... with an appropriate
% number of preceding zeros to ensure lexicographical order.
%
% 2025/03/18, Jon Sporring

n = 1+floor(log10(size(I,3)));
for i = 1:size(I,3)
    imwrite(I(:,:,i),fullfile(dstPath,sprintf('%s%0*d.%s',name,(i<0)+n,i,ext)));
end
