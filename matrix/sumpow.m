%% sumpow.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function y = sumpow(m,p)
    nCr = @(n,k) factorial(n)./(factorial(k).*factorial(n-k));
    y = [];
    for idx = 1:numel(p)
      pp = p(idx);
      k = 0:pp;
      y(idx) = 1./(pp+1) * sum( nCr(pp+1, k) .* -1 .* my_bernoulli(k) .* m.^(pp+1-k) );
    end
  end % sumpow

%% *EOF*
