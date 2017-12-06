#!/opt/myenv/bin/myenv -- octave --persist --no-gui --norc -q
%% est1.m
%% Mac Radigan

  my_preferences;

  dt  = .00001;
  T   = 1;
  Nx  = floor(T/dt);
  t   = linspace(0,T,Nx);

  A   = 1;
  f   = 3.5e3;
  w   = 2*pi*f;
  phi = 0;

  xs   = A*exp(1i*w*t + phi);
  xps  = unwrap(angle(xs));
  xfs  = diff(xps);
  p    = polyfit(t, xps, 1);
  fhat = p./(2*pi);

  figure(101);
    legs = {sprintf('f=%f  fhat=%f',f,fhat(1))};
    rg = 1:1e3;
    subplot(3,1,1);
      plot(real(xs(rg)));
    subplot(3,1,2);
      plot(xps(rg));
    subplot(3,1,3);
      plot(xfs(rg));
      legend(legs);

  sleep(0.1)
  quit

%% *EOF*
