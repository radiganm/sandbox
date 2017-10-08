%% totient.m
%% Copyright 2017 Mac Radigan
%% All Rights Reserved
%%
%% Euler's totient function

  function y = totient(n)
    
    y = sum(1==gcd(1:n-1,n));
    
  end % totient

%% *EOF*
