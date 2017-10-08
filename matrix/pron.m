%% pron.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function V = pron(x,y)
    V = repmat(nan(size(x)), size(y));
    [nx1 nx2] = size(x);
    [ny1 ny2] = size(y);
    for r = 1:nx1
      for c = 1:nx2
        V((r-1)*ny1+(1:ny1), (c-1)*ny2+(1:ny2)) = x(r,c) + y;
      end
    end
  end % pron

%% *EOF*
