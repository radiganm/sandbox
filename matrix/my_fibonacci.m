%% my_fibonacci.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function x = my_fibonacci(n)
    x(n) = nan;
    x(1:2) = [1 1];
    for m=3:n
      x(m) = x(m-1) + x(m-2);
    end
  end % my_fibonacci

%% *EOF*
