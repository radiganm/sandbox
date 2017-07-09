%% inv4.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function [ainv] = inv4(a)
    assert(4==size(a,1));
    assert(4==size(a,2));
    tr = @(x) trace(x);
    I4 = eye(4);
    ainv = 1/det(a) * ( ...
      1/6 * (tr(a)^3 - 3*tr(a)*tr(a^2) + 2*tr(a^3) ) * I4 ...
      -1/2*a*(tr(a)^2-tr(a^2)) + a^2*tr(a) - a^3 ...
      );
  end % inv4

%% *EOF*
