function I = loadSeries(srcPath,varargin)
% LOADSERIES load a sequence of images
%
% Syntax
%   I = loadSeries(srcPath,VERBOSE,filePattern)
%
% Arguments
%   I - a 3D images
%   srcPath - the path to a directory containing a sequence of same-size and format 2D images
%   VERBOSE - optional verbose flag. If true, then will show a waitbar in text. Default is false
%   filePattern - optional file pattern in src to read in lexicographical order. Default is "*.tif"
%
% Read a series of images in lexicographical order and return as a 3D
% image. If filePattern is
%
% 2025/03/18, Jon Sporring

Defaults = {false,"*.tif"};
Defaults(1:nargin-1) = varargin;
[VERBOSE, filePattern] = deal(Defaults{:});

lst = dir(fullfile(srcPath,filePattern));
if isempty(lst)
    warning("loadSeries: empty series");
    I = [];
else
    [~,ind]=sort({lst.name});
    I = imread(fullfile(lst(1).folder,lst(1).name));
    I = repmat(I,[1,1,length(lst)]);
    s = min(50,length(lst))/length(lst);
    if VERBOSE
        waitbarTxt(0,s*length(lst),sprintf("loadSeries: %s",srcPath));
    end
    for i = 1:length(lst)
        I(:,:,i) = imread(fullfile(lst(ind(i)).folder,lst(ind(i)).name));
        if VERBOSE
            %waitbarTxt(s*i,s*length(lst),sprintf("loadSeries: %s",lst(ind(i)).name));
            waitbarTxt(s*i);
        end
    end
end