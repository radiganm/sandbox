%% my_bernoulli.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function b = my_bernoulli(n)
    nx = numel(n);
    for idx = 1:nx
      nn = n(idx);
      for m = 0:nn
        a(m+1) = 1/(m+1);
        for k = fliplr(1:m)
          a(k) = k*(a(k)-a(k+1));
        end
      end
      if nn == 1
        b(idx) = -1*a(1);
      else
        b(idx) = a(1);
      end
    end
  end % my_bernoulli

%% *EOF*
