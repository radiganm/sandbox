%% tesselation_18.mp
%% Copyright 2017 Mac Radigan
%% All Rights Reserved
  
  outputtemplate := "figures/%j-%c.mps";

  beginfig(1)
    M = 18;
    pair A,B,C;
    u = 1mm;
    s = 2;
    h = u*s*2*sqrt(1-1/4);
    w = u*s*1;
    C = +1/2*h*up;
    A = C shifted (+1/2*w,-1/2*h);
    B = C shifted (-1/2*w,-1/2*h);
    picture pic;
    pic:=nullpicture;
    addto pic doublepath A--B--C--cycle withpen currentpen;
    addto pic doublepath A withpen pencircle scaled 2bp;
    addto pic doublepath B withpen pencircle scaled 2bp;
    addto pic doublepath C withpen pencircle scaled 2bp;
    draw pic;
    for m=0 upto M-1:
      for n=-m upto -1:
        draw pic shifted(n*w+m*1/2*w, m*1/2*-h) withcolor black;
      endfor;
      for n=1 upto +m:
        draw pic shifted(n*w-m*1/2*w, m*1/2*-h) withcolor black;
      endfor;
    endfor;
    clip currentpicture to (-4cm,-4cm)--(4cm,-4cm)--(4cm,4cm)--(-4cm,4cm)--cycle;
  endfig;

  bye;

%% *EOF*
