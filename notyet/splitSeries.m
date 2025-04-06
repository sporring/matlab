function splitSeries(L, splitDstPath, varargin)
% SPLITSERIES save an image into 3 orthogonal series
%
% Syntax
%   splitSeries(L,splitDstPath,VERBOSE,prefix,suffix)
%
% Arguments
%   L - a 3D images
%   splitDstPath - the path to a directory containing a sequence of same-size and format 2D images.
%   VERBOSE - optional verbose flag. If true, then will show a waitbar in text. Default is false.
%   prefix - optional file pattern. Default is "im".
%   suffix - optional file pattern in src to read in lexicographical order. Default is "*.tif".
%
% Write a 3D image as 3 sequences of 2D images using imwrite. The 2D images
% will be named <prefix>01_xy<suffix>, <prefix>02_xy<suffix>...,
% <prefix>01_yz<suffix>, <prefix>01_zx<suffix>, with an appropriate number
% of preceding zeros to ensure lexicographical order.
%
% 2025/03/18, Jon Sporring

Defaults = {false,"im",".tif"};
Defaults(1:nargin-2) = varargin;
[VERBOSE, name, suffix] = deal(Defaults{:});

saveSeries(L,splitDstPath,VERBOSE,name+"_xy",suffix);
saveSeries(permute(L,[2,3,1]),splitDstPath,VERBOSE,name+"_yz",suffix,false);
saveSeries(permute(L,[3,1,2]),splitDstPath,VERBOSE,name+"_zx",suffix,false);
