function J = multiplaneCombine(srcPath,name,fun,dstPath,VERBOSE)
% MULTIPLANECOMBINE combine orthogonal sliced 2d series into a single 3D image
%
% Syntax
%   multiplaneCombine(srcPath,name,fun,dst)
%
% Arguments
%   srcPath - the path to a directory containing a number of 2d multiplaner slices
%   name - the base name in srcPath for the files to process
%   fun - the function to combine the three 3D images xy, yz, zx.
%   dst - the destination filename for the combined 3d images
%   VERBOSE - optional verbose flag. If true, then will show a waitbar window
%
% Recombining a 3d image from multiplaner segmentations. The 2d slices must
% be on the form <name>_{xy,yz,zx}.tif as produced by multiplaneSplit.m
%
% 2025/03/18, Jon Sporring

if nargin < 5
    VERBOSE = false;
end
Ixy = loadSeries(srcPath,sprintf('%s_xy*',name),VERBOSE);
Iyz = loadSeries(srcPath,sprintf('%s_yz*',name),VERBOSE);
Iyz = permute(Iyz,[3,1,2]);
Izx = loadSeries(srcPath,sprintf('%s_zx*',name),VERBOSE);
Izx = permute(Izx,[2,3,1]);
J = fun(Ixy,Iyz,Izx);
saveastiff(J, dst);

saveSeries(J,dstPath,name,'.tif',VERBOSE);