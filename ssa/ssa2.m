#!/usr/bin/env octave
%% ssa2.m
%% Mac Radigan

close all;

Nx=100;
dt=.001;
t = [0:Nx-1]*dt;

a=[10, 20, 30];
d=[1, 1, 1, 1];
f=[100, 200, 300];
p=[0, 0, 0, 0];
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
A = zeros(Nn,Nk);
for ii=1:Nn
  for k=1:Nk
    % doc: a_i^k = sum_j=1^m( x_i+j-1 * e_j^k )
    A(ii,k) = A(ii,k)+X(ii,:)*V(k,:)'; 
  end
end

%     phases
y = zeros(size(x));
for ii=1:Nn
  % doc: x_i+j-1 = sum_k=1^m( a_i_k * e_j_k )
  y(ii+[1:Nm]) = y(ii+[1:Nm]) + A(ii,k).*V(k,:); 
end

figure(101); 
  plot(real(x),'g','LineWidth',2);
  hold on;
  plot(real(y),'b','LineWidth',2);

%% *EOF*
