function L = bestOfTwo(I,J,K)
% BESTOFTWO perform pixelwise majority voting on logical arrays
%
% Syntax
%   L = bestOfTwo(I,J,K);
%
% Arguments
%   L, I, J, K - equal size logical arrays
% 
% BestOfTwo performs a pixelwise comparison of 3 logical arrays. If at
% least two are true then the result is true.
% 
% 25/04/06 Jon Sporring

L = I & J | I & K | J & K;