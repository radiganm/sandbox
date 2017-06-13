#!/usr/bin/env octave
%% ssa.m
%% Mac Radigan

close all;

Nx=1000;
dt=.00001;
t = [0:Nx-1]*dt;

a=[10, 20, 30];
d=[.4, 1, 1.2]';
f=[100, 200, 300];
p=[.4, 1, 1.2]';
Nf=length(f);

%% simulation
x = zeros(1,Nx);
for m=1:Nf
  x = x+a(m)*exp(-d(m)*f(m)*t).*sin(2*pi*f(m)*t+p(m));
end

%% analysis
l=1;
Nm=10;
Nn=floor(Nx/Nm)+1;
X=zeros(Nn,Nm);
for n=1:Nn
  ii=n*l;
  X(n,:) = x(ii+[1:Nm]);
end

[U,S,V] = svd(X);

clear a d f p

%% synthesis
Nk=size(V,2);

%     amplitudes
a = zeros(Nn,Nk);
for ii=1:Nn
  for k=1:Nk
    for jj=1:Nm
      a(ii,k) = a(ii,k)+x(ii+jj-1)*V(k,jj);
      %a(ii,k) = a(ii,k)+x(ii+jj-1)*V(jj,k);
    end
  end
end

%     phases
y = zeros(size(x));
for ii=1:Nn
  for k=1:Nk
    for jj=1:Nm
      y(ii+jj-1) = y(ii+jj-1) + a(ii,k)*V(k,jj);
      %y(ii+jj-1) = y(ii+jj-1) + a(ii,k)*V(jj,k);
    end
  end
end

figure(101); 
  plot(real(x),'b','LineWidth',2);
  hold on;
  plot(real(y),'g','LineWidth',2);

%% *EOF*
