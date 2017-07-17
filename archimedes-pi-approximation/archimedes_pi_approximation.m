#!/usr/bin/octave -q
%% archimedes_pi_approximation.m
%% Copyright 2016 Mac Radigan
%% All Rights Reserved

  N = 14;

  e2(1) = 2;
  s(1) = 2;

  for k=2:N
    e2(k) = 2 - 2 * (1 - e2(k-1)/4)^(1/2);
    s(k) = 2 * s(k-1);
  end
  
  mypi = s .* e2.^(1/2);
  thepi = ones(size(mypi)) * pi;
  it = 1:numel(mypi);
  
  tbl = [it; mypi; thepi; thepi-mypi]'

%% *EOF*
