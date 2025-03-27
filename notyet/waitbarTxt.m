function waitbarTxt(i,n,msg)
% loadseries print a wait progress bar in text
%
% Syntax
%   waitbarTxt(i,n,msg)
%
% Arguments
%   i - the current state, 0 <= i <= n
%   n - the maximum state, n >= 1
%   msg - any text message to be printed after the progress bar
%
% Print the progress to the terminal, e.g., 
%
%   n = 10; 
%   waitbarTxt(0,n,"progress"); 
%   for i = 1:n; 
%     waitbarTxt(i); 
%     pause(0.2); 
%   end
%
% prints a sequence like "****      |" with an increasing number of '*'
% characters.
%
% 2025/03/18, Jon Sporring

persistent n_
persistent msg_
persistent str_

if isempty(msg_)
    msg_ = "";
end
if isempty(str_)
    str_ = "";
end
if nargin > 1
    n_ = n;
end
if nargin > 2
    msg_ = msg;
end
if n_ == 0 %% assume that this is a restart after a cancellation
    str_ = "";
end
str = sprintf("%s%s%c %s",repmat('*',[1,floor(i)]),repmat(' ',[1,ceil(n_-i)]),'|',msg_);
if str ~= str_
    fprintf(repmat('\b',[1,strlength(str_)]));
    str_ = str;
    fprintf(str_);
end
if i == n_
    fprintf("\n")
    clear str_ n_ msg_
end
