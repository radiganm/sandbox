%% my_cofactor.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function c = my_cofactor(a, m, n)
    c = (-1)^(m+n)*det(minor(a,m,n));
  end % my_cofactor

%% *EOF*
