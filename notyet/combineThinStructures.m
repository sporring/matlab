function L = combineThinStructures(I,J,K,sz,VERBOSE)
% COMBINETHINSTRUCTURES combine 3 equal size segmentations
%
% Syntax
%   L = combineThinStructures(I,J,K,sz)
%
% Arguments
%   L, I, J, K - equal sized 3D images
%   sz - the radius of a sphere structure element
%
% Combine the 3D tomographies I, J, and K segmentations into a single
% images L by 1. apply a tubular mask along the 3rd dimension, dilate I, J,
% and K independently with a spherical structure element of radius sz, take
% the pixelwise majority vote, fill holes, and erode the result with the
% same spherical structure element.
%
% 2025/03/18, Jon Sporring
if nargin < 5
    VERBOSE = false;
end

if VERBOSE
    waitbarTxt(0,4,"combineThinStructures: Masking");
end
[r,c] = ndgrid(1:size(I,1),1:size(I,2));
Mask = (r-size(I,1)/2).^2+(c-size(I,2)/2).^2 <= (min(size(I,1),size(I,2))/2).^2;
Mask = repmat(Mask,[1,1,size(I,3)]);
I = Mask & I;
J = Mask & J;
K = Mask & K;
if sz > 0
    se = strel("sphere",sz);
end
if VERBOSE
    waitbarTxt(1,4,"combineThinStructures: Dilating");
end
if sz > 0
    I = imdilate(I,se);
    J = imdilate(J,se);
    K = imdilate(K,se);
end
if VERBOSE
    waitbarTxt(2,4,"combineThinStructures: Combining");
end
L = I & J | I & K | J & K;
if VERBOSE
    waitbarTxt(3,4,"combineThinStructures: Filling holes");
end
if sz > 0
    L = imfill(L,"holes"); % very slow, probably imreconstruct
end
if VERBOSE
    waitbarTxt(4,4,"combineThinStructures: Eroding");
end
if sz > 0
    L = imerode(L,se);
end
