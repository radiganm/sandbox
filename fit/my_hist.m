%% my_hist.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function my_hist(x)
  
    N = 50;
    NS = 2.5;
    stats = calc_stats(x, zeros(size(x)));
    rng = linspace(-1*NS*stats.stddev, +1*NS*stats.stddev, N) + stats.mean;
    [cnt,ind] = histc(x, rng);
    if numel(rng)==numel(unique(rng))
      bar(rng,cnt);
    else
      warning('duplicate values in range');
    end
  
  end % my_hist

%% *EOF*
