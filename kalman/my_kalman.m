%% my_kalman.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function [x_hat, P, K] = my_kalman(z, F, H, R, Q, x0, P)
  
    I = eye(size(F));
    x_hat(:,1) = x0;
  
    for k=2:size(z,2)
  
      % predict
      x_p = F*x_hat(:,k-1);             % a priori state estimate
      P_p = F*P*F'+ Q;                  % a priori estimate covariance
  
      % innovate
      y = z(:,k) - H*x_p;               % measurement residual
      S = R + H*P_p*H';                 % residual covariance
  
      % update
      K = P_p*H'*pinv(S);               % optimal Kalman gain
  %   K = P_p*H'*inv2(S);               %   (without Matlab built-in)
      x_hat(:,k) = x_p + K*y;           % a posteriori state estimate
      P = P_p - K*S*K';                 % a posteriori estimate covariance
  
    end % each step
  
  end % function my_kalman

%% *EOF*
