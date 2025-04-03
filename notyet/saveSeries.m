function saveSeries(I,dstPath,prefix,suffix,VERBOSE)
% SAVESERIES load a sequence of images
%
% Syntax
%   saveSeries(I,dstPath,prefix,suffix,VERBOSE)
%
% Arguments
%   I - a 3D volume image
%   dstPath - the destination folder
%   prefix - base of the resulting 2d filenames
%   suffix - filename extension, e.g., '.tif'
%   VERBOSE - optional verbose flag. If true, then will show a waitbar window
%
% Write a 3D image as a sequence of 2D images using imwrite. The 2D images
% will be named <prefix>01<suffix>, <prefix>02<suffix>... with an appropriate
% number of preceding zeros to ensure lexicographical order.
%
% 2025/03/18, Jon Sporring

if nargin < 5
    VERBOSE = false;
end
if ~exist(dstPath,'dir')
    mkdir(dstPath)
end
n = 1+floor(log10(size(I,3)));
s = min(50,size(I,3))/size(I,3);
if VERBOSE
    waitbarTxt(0,s*size(I,3),sprintf("saveSeries: %s", dstPath));
end
for i = 1:size(I,3)
    name = sprintf('%s%0*d%s',prefix,(i<0)+n,i,suffix);
    imwrite(I(:,:,i),fullfile(dstPath,name));
    if VERBOSE
        waitbarTxt(s*i);
    end
end
