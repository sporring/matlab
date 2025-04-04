function v = randomSample(h,n)
% RANDOMSAMPLE generate random samples distributed similarly to a histogram
%
% Syntax:
%   v = randomSample(h,n)
% 
% Arguments:
%   v - an array of n 1D samples in the interval [1,length(h)]
%   h - a histogram, must only contain non-negative values
%   n - the number of samples to generate
%
% Random samples are generated according to the histogram h of uniform bin
% width. The histogram value h(i) is interpreted to represent the interval
% [i,i+1].
%
% Example:
%   x = 7+2*randn(1,1000); % samples from a N(7,2) distribution
%   [N,edges] = histcounts(x,100); % generate histogram counts
%   v = randomSample(N,length(x)); % samples following the histogram counts
%   y = edges(1)+(edges(2)-edges(1))*v; % transformation from index to histogram bins 
%   histogram(x,edges); 
%   hold on; 
%   histogram(y,edges); 
%   hold off
%
% 2025/04/04, Jon Sporring

c = [0,cumsum(h+1e-10)];
v = interp1(c,1:length(c),(c(end)-c(1))*rand(1,n));
