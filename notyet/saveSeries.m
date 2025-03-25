function saveSeries(I,dstPath,name,ext,VERBOSE)
% SAVESERIES load a sequence of images
%
% Syntax
%   saveSeries(I,dstPath,name,ext,VERBOSE)
%
% Arguments
%   I - a 3D volume image
%   dstPath - the destination folder
%   name - base of the resulting 2d filenames
%   ext - filename extension, e.g., 'tif'
%   VERBOSE - optional verbose flag. If true, then will show a waitbar window
%
% Write a 3D image as a sequence of 2D images using imwrite. The 2D images
% will be named <name>01.<ext>, <name>02.<ext>... with an appropriate
% number of preceding zeros to ensure lexicographical order.
%
% 2025/03/18, Jon Sporring

if nargin < 5
    VERBOSE = false;
end
n = 1+floor(log10(size(I,3)));
s = min(50,size(I,3))/size(I,3);
if VERBOSE
    waitbarTxt(0,s*size(I,3),"loadSeries: Reading images");
end
for i = 1:size(I,3)
    imwrite(I(:,:,i),fullfile(dstPath,sprintf('%s%0*d.%s',name,(i<0)+n,i,ext)));
    if VERBOSE
       waitbarTxt(s*i);
    end
end
