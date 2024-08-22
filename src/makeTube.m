function I = makeTube(r,d)
%MAKETUBE generate a 3D image of a filled tube with rounded endings
%       I = makeTube(r,d)
%         I - the resulting 3D image with 0 outside and 1 inside the tube
%         r - the radius of the tube and of the half spheres endings
%         d - optional direction and length of the cylinder
%
%       Make an image of a 3D filled tube with rounded ends. The tube is
%       built from a regular filled cylinder with the main axis from
%       [r,r,r] to [r,r,r]+d and with the radius r, and with two
%       half-spheres of radius r appended to each end. Parameter d is
%       optional, and if missing or [0,0,0], then the result is a sphere of
%       radius r. The resulting image is excaclty large enough to contain
%       the image of the tube. Images of tubes are invariant to mirroring
%       through the origin.
% 
%       For example, to make a tube along the diagonal of cylindar length 3
%       and radius 1 do 
%
%           I = makeTube(1,3*ones(1,3))
%           clf; isosurface(I,0.5); axis equal
%
%       Copyright: Jon Sporring, November 9, 2023

if nargin < 1
  d = zeros(1,3);
end

flp = d < 0;
d = abs(d);
v = r*ones(1,3); 
w = v+d;

lsp1 = 1:round(w(1)+r);
lsp2 = 1:round(w(2)+r);
lsp3 = 1:round(w(3)+r);
[x1,x2,x3] = ndgrid(lsp1,lsp2,lsp3);

I = zeros(size(x1));
for m = 1:size(I,1)
    for n = 1:size(I,2)
        for o = 1:size(I,3)
            I(m,n,o) = distToSegment([x1(m,n,o),x2(m,n,o),x3(m,n,o)],v,w)<r;
        end
    end
end
if flp(1)
    I = flip(I,1);
end
if flp(2)
    I = flip(I,2);
end
if flp(3)
    I = flip(I,3);
end
