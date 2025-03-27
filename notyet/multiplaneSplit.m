function multiplaneSplit(src,dstPath,VERBOSE)
% MULTIPLANARSPLIT reslice a 3d images into orthogonal 2d planes
%
% Syntax
%   multiplaneSplit(src,dstPath,VERBOSE)
%
% Arguments
%   src - the filename of the 3D multipage tiff image
%   dstPath - the path to a destination directory for 2d slices
%   VERBOSE - optional verbose flag. If true, then will show a waitbar window
%
% Producing a directory of 2-dimensional images from a 3d images to be
% segmented with RootPainter (https://github.com/Abe404/root_painter). The
% resulting filenames are coded such they can be combined in a reversible
% manner. Assuming the 3D image has a filename on the form
% <path>/<name>.<ext>, 2D images <dstPath>/<name>_{xy,yz,zx}<i>.tif will be
% created where <i> is an integer preceeded with 0s to ensure
% lexicographical order corresponding to the order of the 3rd dimension in
% the 3D image.
%
% 2025/03/18, Jon Sporring

if nargin < 5
    VERBOSE = false;
end

I = tiffreadVolume(src);
[~,name,~] = fileparts(src);
saveSeries(I,dstPath,name+"_xy",".tif",VERBOSE);
saveSeries(permute(I,[2,3,1]),dstPath,name+"_yz",".tif",VERBOSE);
saveSeries(permute(I,[3,1,2]),dstPath,name+"_zx",".tif",VERBOSE);
