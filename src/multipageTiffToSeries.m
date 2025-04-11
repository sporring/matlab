function multipageTiffToSeries(src,dstPath,name,ext)
% MULTIPAGETIFFTOSERIES read a multipage tiff and save as a sequence of images
%
% Syntax
%  multipageTiffToSeries(src,dstPath,name,ext)
%
% Arguments
%   src - the filename of the 3D multipage tiff image
%   dstPath - the path to a destination multipage tiff file
%   name - base of the resulting 2d filenames
%   ext - filename extension, e.g., 'tif'
%
% Write a 3D image as a sequence of 2D images using imwrite. The 2D images
% will be named <name>01.<ext>, <name>02.<ext>... with an appropriate
% number of preceding zeros to ensure lexicographical order.
%
% 2025/03/18, Jon Sporring

I = tiffreadVolume(src);
saveSeries(I,dstPath,name,ext)
