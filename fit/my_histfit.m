%% my_histfit.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function my_histfit(x)
  
    N = 50;
    NS = 5;
    stats = calc_stats(x, zeros(size(x)));
    w = NS*stats.stddev;
    rng = linspace(-w, w, N) + stats.mean;
    [cnt,ind] = histc(x, rng);
    if numel(rng)==numel(unique(rng))
      tot = sum(cnt);
      apdf = (cnt)/tot;
      bar(rng, apdf);
      hold on;
      gausn = @(x, mu, sig) exp(-0.5*((x-mu)/sig).^2)/(sig*sqrt(2*pi));
      mx = max(x);
      mu = mean(x);
      sig = std(x);
      xint = abs(trapz(cnt/tot, rng));
      gpdf = gausn(rng, mu, sig) * xint;
      plot(rng, gpdf);
    else
      warning('duplicate values in range');
    end
  
  end % my_histfit

%% *EOF*
