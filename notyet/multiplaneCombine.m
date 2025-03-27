function J = multiplaneCombine(srcPath,prefix,suffix,fun,dstPath,VERBOSE)
% MULTIPLANECOMBINE combine orthogonal sliced 2d series into a single 3D image
%
% Syntax
%   J = multiplaneCombine(srcPath,prefix,suffix,fun,dstPath,VERBOSE)
%
% Arguments
%   J - the combined image also saved in dstPath
%   srcPath - the path to a directory containing a number of 2d multiplaner slices
%   prefix - the prefix name in srcPath for the files to process
%   siffix - the suffix name in srcPath for the files to process
%   fun - the function to combine the three 3D images xy, yz, zx.
%   dstPath - the destination path for the combined 3d images
%   VERBOSE - optional verbose flag. If true, then will show a waitbar window
%
% Recombining a 3d image from multiplaner segmentations. The 2d slices must
% be on the form <suffix>_{xy,yz,zx}01<prefix>,
% <suffix>_{xy,yz,zx}02<prefix>, ... as produced by multiplaneSplit.m
%
% 2025/03/18, Jon Sporring

if nargin < 5
    VERBOSE = false;
end
Ixy = loadSeries(srcPath,sprintf('%s_xy*%s',prefix,suffix),VERBOSE);
Iyz = loadSeries(srcPath,sprintf('%s_yz*%s',prefix,suffix),VERBOSE);
Iyz = permute(Iyz,[3,1,2]);
Izx = loadSeries(srcPath,sprintf('%s_zx*%s',prefix,suffix),VERBOSE);
Izx = permute(Izx,[2,3,1]);
J = fun(Ixy,Iyz,Izx);
saveSeries(J,dstPath,prefix,suffix,VERBOSE);