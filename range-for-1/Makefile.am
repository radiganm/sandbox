## makefile.am
## Copyright 2016 Mac Radigan
## All Rights Reserved

AM_LDFLAGS  = -pthread                                                         \
              -L/usr/lib -ldl -lm                                              \
              -static

AM_CPPFLAGS = -I$(top_srcdir)/include                                          \
              -std=c++1z                                                       \
              -g
AM_FCFLAGS  = -Jmod

sandbox_ldadd              = libsandbox.la                                     \
                           -ldl -lm                                            \
                           -lrt                                                 

bin_PROGRAMS               = test_foo                                          

test_foo_SOURCES           = src/tests/test_foo.cc
test_foo_LDADD             = $(sandbox_ldadd)

lib_LTLIBRARIES            = libsandbox.la
libsandbox_la_SOURCES      = src/packages/io/Iterator.cc                       \
                             src/packages/io/File.cc                           \
                             src/packages/foo/FooFileA.cc                       

libsandbox_la_LIBADD       = -lz                                               \
                             -L/usr/lib/x86_64-linux-gnu -lrt

libsandbox_la_LDFLAGS      = -export-symbols-regex '^sandbox_[^_]' -fPIC       \
                             -shared -pthread                                  \
                             -L/usr/lib/x86_64-linux-gnu -lrt

pkginclude_HEADERS         = include/packages/io/Iterator.h                    \
                             include/packages/io/File.h                        \
                             include/packages/foo/FooFileA.h                    

## *EOF*
