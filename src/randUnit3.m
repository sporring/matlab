function p = randUnit3(n)
%RANDUNIT3 Uniformly and randomly distributed points on a sphere
%       p = randUnit3(n)
%         p - random 3D points with length 1
%         n - the number of points to generate
%
%       n random points are generated in 3D using Archimedes rule in which
%       random points on a 3d cylinder in the z-direction is projected back
%       onto the enclosed unit sphere.
%
%       For example, to generate 10 random 3D points of length 1 do
%
%           p = randUnit3(10)
%           plot3(p(1,:),p(2,:),p(3,:),'.')
%
%       Copyright: Jon Sporring, November 9, 2023



% We use Archimedes rule of points projected on a cylinder from a sphere
theta = 2*pi*rand(1,n);
z = 2*rand(1,n)-1;

% Project from the cylinder to the enclosing sphere
v = cos(theta);
w = sin(theta);
t = sqrt((1-z.^2)./(v.^2+w.^2));
p = [t.*v;t.*w;z];
