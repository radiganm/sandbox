#!/usr/bin/env octave
%% pof.m
%% Mac Radigan

dt=.001;
tf=1;
%Nx=100;
Nx=floor(tf/dt);
%t = [0:Nx-1]*dt;
t = linspace(0,tf,Nx);

r = 1e-1*[1, 2, 3, 4];
a = 1e-1*[1, 2, 3, 4];
f = 1e4*[1 2 3 4];
s = -a+j*2*pi*f;
p=[0, 0, 0, 0];
Nf=length(f);

%% simulation
x = zeros(1,Nx);
for m=1:Nf
  x = x+r(m)*exp(s(m).*t);
end

%% analysis
l=3;
Nm=10;
Nn=floor(Nx/Nm)+1;
X=zeros(Nn,Nm);
for n=1:Nn
  ii=n*l;
  X(n,:) = x(ii+[1:Nm]);
end

[U,S,V] = svd(X);

s = diag(S);

figure; plot(x);
