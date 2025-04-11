function J = trim(I)
% trim return the smallest axis aligne cube containing all true values in I
%
% Syntax
%   J = trim(I)
% 
% Arguments
%   J, I - 3 dimensional logical arrays
% 
% Example 
%   I = false(20,10,5);
%   I(10:14,2:3,2:4) = true;
%   J = trim(I); % J is the 5x2x3 subset of I of true values
%   
% 2025/04/06, Jon Sporring

x = any(I,[2,3]);
y = any(I,[1,3])';
z = squeeze(any(I,[1,2]));
x0 = find(x,1,"first");
x1 = find(x,1,"last");
y0 = find(y,1,"first");
y1 = find(y,1,"last");
z0 = find(z,1,"first");
z1 = find(z,1,"last");
J = I(x0:x1,y0:y1,z0:z1);
