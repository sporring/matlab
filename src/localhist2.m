function [H,binCenters] = localhist2(I,sigma,beta,alpha,binCenters)
%LOCALHIST2  Local soft histogram of an image.
%
%       H = localhist2(I,sigma,beta,alpha,N)
%         I - the original an image
%         sigma - the standard deviation of the Gaussian to smooth the
%             image with. (default 1)
%         beta - the standard deviation of the Gaussian to soften the
%             isophotes with. (default 1)
%         alpha - the standard deviation of the Gaussian window.
%              (default 1)
%         binCenters - the center of bins;
%
%       This function returns the local histogram in all points of an image
%       for a specific setting of sigma, beta, and alpha.  Hence, the output
%       H, is of dimension ndims(I)+1, and the histogram will be sampled around
%       binCenters. In order not to confuse scales, it is strongly
%       recommended that the binCenters are space 1 unit apart.
%
%       Example:
%         I = 16*rand(64,64);
%         binCenters = linspace(0,16,17);
%         H = localhist2(I,2,1,1,binCenters);
%         plot(binCenters,squeeze(H(32,32,:)));
%
%       Copyright: Jon Sporring, December 1, 1999
%
%       History:
%       2019/02/13, sporring: changed max intensity into bin edge list

  % Checking parameters and setting default;
  if nargin < 1
    error('Image I must be supplied! Usage: H = localhist2(I,sigma,beta,alpha,N)');
  end
  if nargin < 2
    sigma = 1;
  end
  if nargin < 3
    beta = 1;
  end
  if nargin < 4
    alpha = 1;
  end
    
  % Smoothing image
  if sigma == 0
    if isreal(I)
      L = I;
    else
      L = real(ifft2(I));
    end
  elseif sigma == inf
    if isreal(I)
      L = ones(size(I))*mean(I(:));
    else
      L = ones(size(I))*I(1,1);
    end      
  else
    if isreal(I)
      L = real(ifft2(scale2(fft2(I),sigma,0,0)));
    else
      L = real(ifft2(scale2(I,sigma,0,0)));
    end
  end
  
  if nargin < 5
      binCenters = floor(min(L(:))):ceil(max(L(:)));
  end
  
  % Calculating soft isophote and sum under window
  H = zeros([size(I),length(binCenters)]);
  for i = 1:length(binCenters)
    % disp(i);
    if beta == 0
      if i == 1
        J = (L<mean(binCenters(1:2)));
      elseif i == length(binCenters)
        J = (L>=mean(binCenters(end-1:end)));
      else
        J = (L>=mean(binCenters((i-1):i))) .* (L<mean(binCenters(i:(i+1))));
      end        
    elseif beta == inf
      J = ones(size(L));
    else
      J = 1/sqrt(2*pi*beta^2)*exp(-(L-binCenters(i)).^2/(2*beta^2));
    end
    
    if alpha == inf
      H(:,:,i) = sum(J(:));
    elseif alpha > 0
      H(:,:,i) = real(ifft2(scale2(fft2(J),alpha,0,0)));
      % Clamp values to ensure positivity
      H(:,:,i) = (H(:,:,i)>0).*H(:,:,i);
      % figure(1); plot(H(1,:,i+1)); pause
    else
      H(:,:,i) = J;
    end
  end
  
  % Ensure that the histogram sums to 1
  H = H./repmat(sum(H,3),[1,1,size(H,3)]);
