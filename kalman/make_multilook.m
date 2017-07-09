%% make_multilook.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function [y, F, label] = make_multilook(x, k1, k2, N1, N2, dt)
  
    label = sprintf('K-F%dD%dN%d', k1, k2, min(N1,N2));
  
    F = zeros(k1+k2);
  
    for m1 = 1:k1
      k = m1;
      y(k,:) = circshift(x(1,:), [1 N1*(m1-1)]);
    end
    for m2 = 1:k2
      k = k1 + m2;
      y(k,:) = circshift(x(2,:), [1 N2*(m2-1)]);
    end
  
    %% Q1
    for m1 = 1:k1
      for m2 = 1:k1
        F(m1,m2) = 1/k1;
      end
    end
  
    %% Q2 - all zeros
  
    %% Q3
    for m1 = 1:k1
      for m2 = k1+1:k1+k2
        F(m1,m2) = dt/k2;
      end
    end
  
    %% Q4
    for m1 = k1+1:k1+k2
      for m2 = k1+1:k1+k2
        F(m1,m2) = 1/k2;
      end
    end
  
  end % function make_multilook

%% *EOF*
