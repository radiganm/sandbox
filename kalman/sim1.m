%% test_kalman.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved
    
  %% 1: Kalman
  F = [1 dt; 0 1];           % state equations
  H = eye(size(F));          % observation matrix
  L = 0;                     % limiter
  P0 = L * eye(size(F));     % initial covariance

  z0 = x(:,1);               % initial measurement (a priori)
  R = eye(size(F));          % observation noise covariance
  Q = eye(size(F));          % process noise covariance
  P = P0;

  [x_hat P K] = my_kalman(x_test, F, H, R, Q, z0, P0);

  x_hat = [];

  N = numel(x(1,:));
  for k = 1:N
    %z = x(1,k);
    z = x(:,k);
    [x_hat(:,k) P K] = my_kalman_it(z, F, H, R, Q, z0, P0);
  end

%% *EOF*
