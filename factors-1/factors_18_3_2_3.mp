%% factors_18_3_2_3.mp
%% Copyright 2017 Mac Radigan
%% All Rights Reserved
  
  outputtemplate := "figures/%j-%c.mps";

  beginfig(1)

    %% unit
    M.0 = 18;
    u.0 = 1mm;
    s.0 = 2;
    h.0 = u.0*s.0*2*sqrt(1-1/4);
    w.0 = u.0*s.0*1;
    pair A,B,C;
    C = +1/2*h.0*up;
    A = C shifted (+1/2*w.0,-1/2*h.0);
    B = C shifted (-1/2*w.0,-1/2*h.0);
    picture picU ;
    picU:=nullpicture;
    addto picU doublepath A--B--C--cycle withpen currentpen;
    addto picU doublepath A withpen pencircle scaled 2bp;
    addto picU doublepath B withpen pencircle scaled 2bp;
    addto picU doublepath C withpen pencircle scaled 2bp;
    
    %% tesselation
    draw picU;
    for m=0 upto M.0-1:
      for n=-m upto -1:
        draw picU shifted(n*w.0+m*1/2*w.0, m*1/2*-h.0) withcolor black;
      endfor;
      for n=1 upto +m:
        draw picU shifted(n*w.0-m*1/2*w.0, m*1/2*-h.0) withcolor black;
      endfor;
    endfor;

    %% factor 3
    f.1 = 3;
    M.1 = M.0/f.1;
    s.1 = s.0 * f.1;
    h.1 = u.0*s.1*2*sqrt(1-1/4);
    w.1 = u.0*s.1*1;
    pair X,Y,Z;
    X = +1/2*h.0*up;
    Y = C shifted (+1/2*w.1,-1/2*h.1);
    Z = C shifted (-1/2*w.1,-1/2*h.1);
    picture picA ;
    picA:=nullpicture;
    addto picA doublepath X--Y--Z--cycle withpen currentpen;
    addto picA doublepath X withpen pencircle scaled 2bp;
    addto picA doublepath Y withpen pencircle scaled 2bp;
    addto picA doublepath Z withpen pencircle scaled 2bp;

    %% factorization 1
    draw picA withcolor blue;;
    for m=0 upto M.1-1:
      for n=-m upto -1:
        draw picA shifted(n*w.1+m*1/2*w.1, m*1/2*-h.1) withcolor blue;
      endfor;
      for n=1 upto +m:
        draw picA shifted(n*w.1-m*1/2*w.1, m*1/2*-h.1) withcolor blue;
      endfor;
    endfor;

    %% factor 2
    f.2 = 2;
    r.2 = f.1;
    M.2 = M.1/(f.2);
    s.2 = s.1 * f.2;
    h.2 = u.0*s.2*2*sqrt(1-1/4);
    w.2 = u.0*s.2*1;
    pair U,V,W;
    U = +1/2*h.0*up;
    V = C shifted (+1/2*w.2,-1/2*h.2);
    W = C shifted (-1/2*w.2,-1/2*h.2);
    picture picB ;
    picB:=nullpicture;
    addto picB doublepath U--V--W--cycle withpen currentpen;
    addto picB doublepath U withpen pencircle scaled 2bp;
    addto picB doublepath V withpen pencircle scaled 2bp;
    addto picB doublepath W withpen pencircle scaled 2bp;
    
    %% factorization 2
    draw picB withcolor red;;
    for m=0 upto M.2-1:
      for n=-m upto -1:
        draw picB shifted(n*w.2+m*1/2*w.2, m*1/2*-h.2) withcolor red;
      endfor;
      for n=1 upto +m:
        draw picB shifted(n*w.2-m*1/2*w.2, m*1/2*-h.2) withcolor red;
      endfor;
    endfor;

    clip currentpicture to (-4cm,-4cm)--(4cm,-4cm)--(4cm,4cm)--(-4cm,4cm)--cycle;
  endfig;

  bye;

%% *EOF*
