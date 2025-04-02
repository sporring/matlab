function q = histogram2Quantile(binEdges,binCounts,p)
% HISTOGRAM2QUANTILE calcualte the p'th quantile from histogram bins and edges
%
% Syntax
%   q = histogram2Quantile(binEdges,binCounts,p)
%
% Arguments
%   binEdges - the left-edges of the bins including the last right edge
%   binCounts - the counts within each bin
%   p - the quantiles to estimate
%
% Estimate the p'th quantile from histogram values. For example,
%
% t = randn(1,1000);
% binWidth = 0.01;
% binEdges = (min(t)-binWidth):binWidth:(max(t)+binWidth);
% binCounts = histcounts(t,binEdges);
% p = 0.1
% q = histogram2Quantile(binEdges,binCounts,p);
% disp([q,quantile(t,p)])
%
% Adapted from https://se.mathworks.com/matlabcentral/answers/1909915-getting-a-percentile-from-a-histogram
%
% 2025/03/25, Jon Sporring

q = arrayfun(@(a) helper(binEdges,binCounts,a),p);

end

function q = helper(binEdges,binCounts,p)

cf = cumsum(binCounts)/sum(binCounts);
i = find(cf>=p,1);
if i > 1
    x0 = binEdges(i);
    dx = binEdges(i+1) - x0;
    f0 = cf(i-1);
    df = cf(i) - f0;
    q = x0 + dx * (p - f0) / df;
else
    q = binEdges(1);
end
end