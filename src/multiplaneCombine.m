function J = multiplaneCombine(srcPath,fun,dstPath,varargin)
% MULTIPLANECOMBINE combine orthogonal sliced 2d series into a single 3D image
%
% Syntax
%   J = multiplaneCombine(srcPath,fun,dstPath,VERBOSE,suffix,prefix)
%
% Arguments
%   J - the combined image also saved in dstPath
%   srcPath - the path to a directory containing a number of 2d multiplaner slices
%   fun - the function to combine the three 3D images xy, yz, zx.
%   dstPath - the destination path for the combined 3d images
%   VERBOSE - optional verbose flag. If true, then will show a waitbar text. Default is false.
%   suffix - optional suffix name in srcPath for the files to process. Default is ".tif".
%   prefix - optional prefix name in srcPath for the files to process. Default is "*" (wildcard).
%
% Recombining a 3d image from multiplaner segmentations. The 2d slices
% input must be on the form <suffix>_{xy,yz,zx}01<prefix>,
% <suffix>_{xy,yz,zx}02<prefix>, ... as produced by multiplaneSplit.m. The
% result is saved as a tif series.
%
% 2025/03/18, Jon Sporring

Defaults = {false,".tif","*"};
Defaults(1:nargin-3) = varargin;
[VERBOSE, suffix, prefix] = deal(Defaults{:});

if ~exist(srcPath, "dir")
    error("multiplaneCombine: input `%s` does not exist", srcPath)
else
    if VERBOSE
        fprintf("multiplaneCombine: Loading xy, yz, and zx planes\n");
    end
    Ixy = loadSeries(srcPath,VERBOSE,sprintf('%s_xy*%s',prefix,suffix));
    Iyz = loadSeries(srcPath,VERBOSE,sprintf('%s_yz*%s',prefix,suffix));
    Iyz = permute(Iyz,[3,1,2]);
    Izx = loadSeries(srcPath,VERBOSE,sprintf('%s_zx*%s',prefix,suffix));
    Izx = permute(Izx,[2,3,1]);
    J = fun(Ixy,Iyz,Izx);
    saveSeries(J,dstPath,VERBOSE);
end