%% nconv.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function y = nconv(x,m)
    y = x;
    for k=2:m
      y = conv(x, y);
    end
  end % nconv

%% *EOF*
