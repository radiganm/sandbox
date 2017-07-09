%% my_fit.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function my_fit(x, colorspec, linewidth)
  
    N = 50;
    NS = 3;
    stats = calc_stats(x, zeros(size(x)));
    w = NS*stats.stddev;
    rng = linspace(-w, w, N) + stats.mean;
    [cnt,ind] = histc(x, rng);
    if numel(rng)==numel(unique(rng))
      tot = sum(cnt);
      apdf = (cnt)/tot;
      %bar(rng, apdf);
      %hold on;
      gausn = @(x, mu, sig) exp(-0.5*((x-mu)/sig).^2)/(sig*sqrt(2*pi));
      mx = max(x);
      mu = mean(x);
      sig = std(x);
      xint = abs(trapz(cnt, rng))/tot;
      gpdf = gausn(rng, mu, sig) * xint;
      plot(rng, gpdf, colorspec, 'LineWidth', linewidth);
    else
      warning('duplicate values in range');
    end
  
  end % my_fit

%% *EOF*
