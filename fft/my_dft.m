%% my_dft.m
%% Mac Radigan

  function [f_pk, X_amp] = my_dft(x, t, frange)
    N_t = length(t);
    T = t(N_t) - t(1);
    df = 0.01/T;
    f = frange(1):df:frange(2);
    N_f = length(f);
    y = zeros(1, N_f);
    for k = 1:N_f
      y(k) = sum(x .* exp(-1i*2*pi*f(k)*t));
    end
    [z_max, k_pk] = max(abs(y));
    f_pk = f(k_pk);
    X_amp = y(k_pk)/abs(y(k_pk));
  end % my_dft

%% *EOF*
