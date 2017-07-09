%% freq_plot.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function freq_plot(x, clr, fs, f_max)
  
    N_fact = 1;
    N = N_fact*(2^nextpow2(numel(x)));
    x_f = abs(fftshift(fft(x,N)))/N;
    x_f_pk = max(x_f);
    if mod(N,2), k=-N/2:N/2-1; else k=-(N-1)/2:(N-1)/2; end
    T = N/fs;
    freq = k/T;
    scale = 1e3; unit='kHz'; semilogy(freq/scale, x_f, ...
      'Color', clr, ...
      'LineWidth', 2);
  % scale = 1; unit='Hz'; plot(freq, x_f, ...
  %  'Color', clr, ...
  %  'LineWidth', 3);
    grid on;
    xlabel(sprintf('Frequency (%s)', unit), ...
      'FontSize', 14', 'FontWeight', 'bold');
    ylabel('Magnitude', 'FontSize', 14', 'FontWeight', 'bold');
    if f_max
      xlim([0 f_max]);
    end
    %decfig;
  
  end

%% *EOF*
