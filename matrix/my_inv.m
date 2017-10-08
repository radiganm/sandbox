%% my_inv.m
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function ainv = my_inv(a)
    ainv = 1/det(a)*my_adjugate(a);
  end % my_inv

%% *EOF*
