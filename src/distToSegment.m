function d = distToSegment(p, v, w)
%DISTTOSEGMENT Eucledian distance to a line segment
%       d = distToSegment(p, v, w)
%         d - the calculated distance
%         p - a point
%         v, w - start and end point of a line segment
%
%       Calculate the shortest Euclidean distance from a point to a line
%       segment. Parameters must be vectors.
%
%       For example, to calculate the shortest distance from a random point
%       to the line segment spanned by [0,0,0] and [1,1,1] in 3D do
%
%           distToSegment(randn(1,3), [0,0,0], [1,1,1])
%
%       Copyright: Jon Sporring, November 9, 2023

    l2 = norm(w-v)^2;
    if l2 == 0
        d = norm(w-p);
    else
        t = max(0,min(1,dot(p-v,w-v) / l2));
        d = norm(p-(v + t * (w - v)));
    end