function seriesToMultipageTiff(srcPath,filePattern,dst)
% SERIESTOMULTIPAGETIFF read a sequence of images and save as a multipage tiff
%
% srcPath - the path to a directory containing a sequence of same-size and format 2d images
% filePattern - the file pattern in src to read in lexicographical order
% dst - the path to a destination multipage tiff file
%
% This is a tool to convert a sequence of 2d images into a multipage tiff.
%
% 2025/03/18, Jon Sporring

I = loadSeries(srcPath,filePattern);
saveastiff(I, dst);
