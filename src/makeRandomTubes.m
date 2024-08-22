function [I,rVals,lVals] = makeRandomTubes(Sz, N, pdR, pdL, minDistance)
%MAKERANDOMTUBES generate a 3D image with non-overlapping random tubes
%       [I,rVals,lVals] = makeRandomTubes(Sz, N, pdR, pdL, minDistance)
%         I - the resulting 3D image with 0 outside and 1 inside the tubes
%         rVals - the list of radii of the individual tubes
%         lVals - the list of lengths of the corresponding cylinders
%         Sz - the size of I to be generated
%         N - the maximum number of tubes to be added
%         pdR - the distribution object to generate radii
%         pdL - the distribution object to generate cylinder lengths
%         minDistance - the minimum distance between tubes in I
%
%       Make a 3D image of size Sz of maximally N non-overlapping tupes
%       whos parameters are drawn from the probability distributions pdR
%       for radii and end cap radii and pdL cylinder length distributions.
%       The tubes are randomly placed conditioned on a minDistance to
%       existing tubes, and the function makes at most 2N attempts to
%       randomly add tubes N tubes.  
%
%       Example of up to 100 random tubes of lognormally distributed radii
%       and lengths with a minimum distance of 3 between tubes
%
%          pdR = makedist('Lognormal','mu',log(2),'sigma',log(1.3));
%          pdL = makedist('Lognormal','mu',log(5),'sigma',log(2));
%          [I,r,l] = makeRandomTubes([100,100,100], 100, pdR, pdL, 3);
%          figure(1); clf; isosurface(I,0.5); axis equal;
%          figure(2); subplot(1,2,1); histogram(r,20); title('r'); 
%          subplot(1,2,2); histogram(l,20); title('l');
%
%       Example of up to 100 randomly placed spheres of identical radius
%       log(5) with a minimum distance of 10 between the spheres 
%          pdR = makedist('Lognormal','mu',log(5),'sigma',log(1))
%          pdL = makedist('Lognormal','mu',log(1),'sigma',log(1))
%          [I,r,l] = makeRandomTubes([100,100,100], 100, pdR, pdL, 10);
%       figure(1); clf; isosurface(I,0.5); axis equal;
%       figure(2); subplot(1,2,1); histogram(r,20); title('r'); 
%       subplot(1,2,2); histogram(l,20); title('l');
%
%       Copyright: Jon Sporring, November 9, 2023    

if nargin == 4
  minDistance = 2;
end

I = zeros(Sz);

j = 0;
rVals = [];
lVals = [];
for i = 1:2*N
    % Create a random rounded tube with radius r and (inner tube) length l
    r = pdR.random;
    l = pdL.random;
    d = l*randUnit3(1)';
    tb = makeTube(r,d);
    % Create a dilated version of tb, |v| + a = |b v| = b |v| => b = 1+a/|v|
    tbExp = makeTube(r+minDistance,d*(1+minDistance/l));

    if all(size(I)>size(tbExp))
        % consider placing bottom left corner in p
        p = min(size(I),max([1,1,1],round(1+(Sz-size(tbExp)-1).*rand(1,3))));

        % check if expanded tube does not overlap with already placed tubes 
        x1Vals = p(1)+(0:size(tbExp,1)-1);
        x2Vals = p(2)+(0:size(tbExp,2)-1);
        x3Vals = p(3)+(0:size(tbExp,3)-1);
        J = I(x1Vals,x2Vals,x3Vals);
        if all(J.*tbExp==0,"all")
            % insert tb into the image and update counters and r,l values
            x1Vals = p(1)+minDistance+(0:size(tb,1)-1);
            x2Vals = p(2)+minDistance+(0:size(tb,2)-1);
            x3Vals = p(3)+minDistance+(0:size(tb,3)-1);
            I(x1Vals,x2Vals,x3Vals) = I(x1Vals,x2Vals,x3Vals) + tb;
            rVals(end+1) = r;
            lVals(end+1) = l;
            j = j+1;
        end
        if j == N
            break;
        end
    end
end