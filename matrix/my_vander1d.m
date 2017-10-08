%% my_vander1d.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function y = my_vander1d(x,n)
    y = ones(size(x))';
    for k=1:n
      y = horzcat(y, (x.^k)');
    end
  end % my_vander1d

%% *EOF*
