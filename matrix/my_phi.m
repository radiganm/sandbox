%% my_phi.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function p = my_phi(n)
    x = my_fibonacci(n);
    p = x(end)/x(end-1);
  end % my_phi

%% *EOF*
