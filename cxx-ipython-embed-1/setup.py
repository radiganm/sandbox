#!/usr/bin/env python3
### setup.py
###
### Copyright 2017 Mac Radigan
### All Rights Reserved

from distutils.ccompiler import new_compiler
from distutils.extension import Extension
from Cython.Distutils    import build_ext
from distutils.core      import setup
from Cython.Build        import cythonize

name = 'pyembed'
out = '.'

cc = new_compiler()
cc.add_include_dir('/usr/include/python3.5m')

cythonize(['library/shell/*.py'])
objects = cc.compile(['library/shell/Embed.c'])
cc.create_static_lib(objects, name, output_dir=out)
#cc.link_shared_lib(objects, name, output_dir=out)

### *EOF*
