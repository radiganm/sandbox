%% hornerval1d.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function y = hornerval1d(p,x)
    n = numel(p);
    y = p(1) * ones(size(x));
    for k = 2:n
      y = p(k) + y.*x;
    end
  end % hornerval1d

%% *EOF*
