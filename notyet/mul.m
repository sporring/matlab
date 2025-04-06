function K = mul(I,J,method)
% MUL multiply 3 dimensional images in the coordinates of the first argument
%
% K = mul(I,J)
%
% Arguments
%   K, I, J - 3-dimensional images
%   method - an optional interpolation method for interpn. Default is "linear".
%
% Mul performs the hadamard product of I and J at the resolution of I. J is
% up- or downsampled accordingly using interpn(J,xq1,xq2,xq3,method), where
% xq1..3 are the cooresponding gridpoint in J.
%
% 2025/03/31 Jon Sporring

if any(size(I)~=size(J))
    if nargin < 3
        method = "linear";
    end
    K = I.*resample3(J,size(I),method);
else
    K = I.*J;
end
