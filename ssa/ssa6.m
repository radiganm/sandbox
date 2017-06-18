#!/usr/bin/env octave
%% ssa6.m
%% Mac Radigan

close all;

dt=.01;
tf=1;
%Nx=100;
Nx=floor(tf/dt);
%t = [0:Nx-1]*dt;
t = linspace(0,tf,Nx);

r = 1e-1*[1, 2, 3, 4];
a = 1e-1*[1, 2, 3, 4];
%f = 1e4*[1 2 3 4];
f = 1e4*[1];

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

%% synthesis
Nk=size(V,2);

%     amplitudes
A = zeros(Nn,Nk);
for ii=1:Nn
  for k=1:Nk
    A(ii,k) = A(ii,k)+X(ii,:)*V(k,:)'; 
  end
end

%     phases
y = zeros(size(x));
for ii=1:Nn
  for jj=1:Nm
    y(ii+jj-1) = A(ii,:)*V(:,jj); 
  end
end

figure(101); 
  plot(real(x),'g','LineWidth',2);
  hold on;
  plot(real(y),'b','LineWidth',2);

if(0)
  figure(102); 
  for m=1:Nf
    x1 = r(m)*exp(s(m).*t);
    plot(real(x1),'g','LineWidth',2);
    hold on
  end
end

%% *EOF*