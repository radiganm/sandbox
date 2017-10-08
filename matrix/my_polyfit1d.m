%% my_polyfit1d.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function p = my_polyfit1d(x,y,n)
    X = my_vander1d(x,n);
    %p = fliplr((pinv(X)*y')');
    p = fliplr((X\y')'); % better numerical stability
  end % my_polyfit1d

%% *EOF*
