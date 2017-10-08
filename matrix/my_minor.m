%% my_minor.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function b = my_minor(a, m, n)
    [nr nc] = size(a);
    assert(nr == nc); % square matrix
    r = [1:m-1, m+1:nr];
    c = [1:n-1, n+1:nc];
    b = a(r,c);
  end % my_minor

%% *EOF*
