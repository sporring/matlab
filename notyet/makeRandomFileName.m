function fn = makeRandomFileName(path,pattern,n)
% MAKERANDOMFILENAME make a random, non-existing filename in path
%
% Syntax
%   makeRandomFileName(path,pattern,n)
%
% Arguments
%   fn - a non-existing filname
%   path - the directory to search in
%   pattern - the sprintf pattern for the filename and which takes a random integer 
%   n - the number of digits to use in the random integer pattern
%
% The function generates a non-existing filename by trying random n-digit
% integers using sprintf. E.g., makeRandomFileName(".","test%d.tif",3) will
% try files such as test251.tif, test923.tif until the first non-existing
% filenames in ".". After 100 non-successful attempts, the function will
% return an empty string.
%
% 2025/03/18 Jon Sporring

cont = true;
k = 0;
fn = "";
while(cont && k < 100)
    m = 10^(n-1) + floor((10^n-10^(n-1))*rand(1));
    fn = fullfile(path,sprintf(pattern,m));
    if ~isfile(fn)
        cont = false;
    end
end
