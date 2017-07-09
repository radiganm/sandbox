%% sim2.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved
 
  %% simulation parameters
  f0 = [1e5; 0.1];                         % initial frequency and doppler
  M = 4;                                   % multiplicity

  %-%  simulation time
  time.t1 = 0;
  time.dt = 1/f0(1);
  time.tf = time.t1 + 1e3*time.dt;
  time.t = [time.t1:time.dt:time.tf];
  time.N = numel(time.t);
  time.k = 1:time.N;

  apriori = 1;                             % if not known a priori, assume independent
  F = [1 time.dt; 0 1];                    % state equations

  %-%  process noise model
  nu_proc.mu = [1e-3; 1e-2]; % mean
  nu_proc.sd = [0.5; 0.4];     % standard deviation
  nu_proc.r = 0.8;
  nu_proc.b = nu_proc.r * rand(size(F));
  nu_proc.sig_xy = nu_proc.b .*(~eye(size(F)));
  nu_proc.sig_xx = (nu_proc.sd * nu_proc.sd').^0.5.*eye(size(F,1));
  nu_proc.sig = ( (nu_proc.sig_xy+nu_proc.sig_xx) * (nu_proc.sig_xy+nu_proc.sig_xx)' ).^0.5;
  nu_proc.C = nu_proc.sig;
  nu_proc.v = mvnrnd((nu_proc.mu * time.k)', nu_proc.C)';

  %-%  observation noise model
  nu_obsv.mu = [1e-3; 1e-2];  % mean
  nu_obsv.sd = [0.5; 0.5];    % standard deviation
  nu_obsv.r = 0.2;
  nu_obsv.b = nu_obsv.r * rand(size(F));
  nu_obsv.sig_xy = nu_obsv.b .*(~eye(size(F)));
  nu_obsv.sig_xx = (nu_obsv.sd * nu_obsv.sd').^0.5.*eye(size(F,1));
  nu_obsv.sig = ( (nu_obsv.sig_xy+nu_obsv.sig_xx) * (nu_obsv.sig_xy+nu_obsv.sig_xx)' ).^0.5;
  nu_obsv.C = nu_obsv.sig;
  nu_obsv.v = mvnrnd((nu_obsv.mu * time.k)', nu_obsv.C)';
  % multilook
  nu_obsv.M = M;
  nu_obsv.v_ml{1} = nu_obsv.v;
  for k=2:nu_obsv.M
    nu_obsv.v_ml{k} = mvnrnd((nu_obsv.mu * time.k)', nu_obsv.C)';
  end % multilook

  if apriori
    Q = nu_proc.C;                         % process noise covariance
    R = nu_obsv.C;                         % observation noise covariance
  else
    Q = eye(size(F));                      % process noise covariance
    R = eye(size(F));                      % observation noise covariance
  end

  %-%  signal model
  sig.s0 = f0;  % initial frequency
  sig.s(2,:) = sig.s0(2)/time.dt * ones(size(time.t));
  sig.s(1,:) = sig.s0(1) + sig.s(2,:) .* time.t;

  %-%  process model
  proc.F = F;
  proc.x0 = [sig.s0(1); sig.s0(2)/time.dt];
  proc.x(:,1) = proc.x0;
  for k=time.k
    proc.x(:,k) = proc.F^k * proc.x0 + nu_proc.v(:,k);
  end

  %-%  measurement model
% obsv.H = [1 0; 0 0];
  obsv.H = eye(2);
  obsv.z = proc.x + nu_obsv.v;
  H = obsv.H;
  % multilook
  obsv.z_ml{1} = obsv.z;
  for k=2:nu_obsv.M
    obsv.z_ml{k} = proc.x + nu_obsv.v_ml{k};
  end % multilook

  model = struct( ...
    'time',time, ...
    'nu_obsv',nu_obsv, ...
    'nu_proc',nu_proc, ...
    'sig',sig, ...
    'proc',proc, ...
    'obsv',obsv);

  s = proc.x;                              % signal
  z = obsv.z;                              % measurement

  if apriori
    z0 = mean(z, 2);                       % initial measurement (a priori)
    P = (z(:,1)-z0) * (z(:,1)-z0)';        % initial covariance (a priori)
  else
    z0 = z(:,1);                           % initial measurement (blind)
    P = eye(size(F));                      % initial covariance (blind)
  end

  %% 1: Kalman
  [y_kal P K] = my_kalman(z, F, H, R, Q, z0, P);

%% *EOF*
