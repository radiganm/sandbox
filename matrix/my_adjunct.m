%% my_adjunct.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function [c] = my_adjunct(a)
    [nr nc] = size(a);
    c = nan(size(a));
    for m = 1:nr
      for n = 1:nc
        c(m,n) = cofactor(a,m,n);
      end
    end
  end % my_adjugate

%% *EOF*
