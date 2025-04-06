function J = resample3(I,sz,method)
% RESAMPLE3 resample I to become the size sz.
%
% J = mul(I,sz)
%
% Arguments
%   I, J - 3-dimensional images
%   sz - a 3-vector
%   method - an optional interpolation method for interpn. Default is "linear".
%
% resample3 resamples I to become size sz using interpn.
%
% 2025/04/01 Jon Sporring

if nargin < 3
    method = "linear";
end

[x1,x2,x3] = ndgrid(linspace(1,size(I,1),sz(1)),linspace(1,size(I,2),sz(2)),linspace(1,size(I,3),sz(3)));
%J = interpn(I,x1,x2,x3,method);
J = I(round(x1),round(x2),round(x3));