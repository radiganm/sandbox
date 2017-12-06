## my_preferences.m

  PS1("m>< ")

  addpath ~/bin

  edit mode sync
  edit home .

  function ui()
    graphics_toolkit('qt');
   %graphics_toolkit('fltk');
   %setenv('GNUTERM', 'x11');
  end

  function noui()
    graphics_toolkit('gnuplot');
    setenv('GNUTERM', 'dumb');
  end

  noui
 %ui

## *EOF*
