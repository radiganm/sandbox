%% my_cov.m
%% Mac Radigan
%% Copyright 2015 Mac Radigan
%% All Rights Reserved

  function [zz, x1, x2] = my_cov(mu, C, d, alpha, beta)
  
    pmn(1) = mu(1) - C(1,1)*alpha;
    pmn(2) = mu(2) - C(2,2)*beta;
    pmx(1) = mu(1) + C(1,1)*alpha;
    pmx(2) = mu(2) + C(2,2)*beta;
    [x1 x2] = meshgrid(linspace(pmn(1),pmx(1),d), linspace(pmn(2),pmx(2),d));
    xx = [x1(:) x2(:)];
    pdf = mvnpdf(xx, mu, 1 * C);
    zz = reshape(pdf, d, d) ./ max(pdf(:));
  
  end

%% *EOF*
