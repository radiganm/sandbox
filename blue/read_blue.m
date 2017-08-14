%% read_blue.m
%% Copyright 2017 Mac Radigan
%% All Rights Reserved

  function pld = read_blue(filename, fmt)
    
    sprintf('ls -s --block-size=1 %s', filename)
    [x,s] = system(sprintf('ls -s --block-size=1 %s', filename));
    n_bytes = str2num(strtok(s, ' '));
    n_header = 512;
    fid = fopen(filename, 'rb');
    fseek(fid, n_header, SEEK_SET());
    switch(fmt)
      case 'CI'
        raw = fread(fid, n_bytes, 'uint16');
      case 'CX'
        raw = fread(fid, n_bytes, 'float32');
      case 'CD'
        raw = fread(fid, n_bytes, 'float64');
      default
        error('unsupported format: %s', fmt);
    end 
    iq = reshape(raw(:), 2, []);
    pld = iq(1,:) .+ 1i .* iq(2,:);
    
  end % of read_blue

%% *EOF*
