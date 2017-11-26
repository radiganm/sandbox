## Makefile.am

AM_LDFLAGS  = -pthread                                             \
              -L/usr/lib -ldl -lm                                  \
              -L/usr/lib/x86_64-linux-gnu -lgflags                 \
              -lSoapySDR

AM_CPPFLAGS = -I$(top_srcdir)/include                              \
              -std=c++1z
AM_FCFLAGS  = -Jmod

soapy_ldadd              = \
                           -ldl -lm                                \
                           -lrt                                    \
                           -lSoapySDR                               

#soapy_ldadd              = libsoapy.la                             \
#                           -ldl -lm                                \
#                           -lrt                                    

soapy_ldflags            = -static-libstdc++                       \
                           -L/usr/lib/x86_64-linux-gnu -lgflags

bin_PROGRAMS             = test_rx

test_rx_SOURCES          = src/test_rx.cpp
test_rx_LDADD            = $(soapy_ldadd)
test_rx_LDFLAGS          = $(soapy_ldflags)

#lib_LTLIBRARIES          = libsoapy.la
#libsoapy_la_SOURCES      = 
#
#libsoapy_la_LIBADD       = -lz                                                 \
#                           -L/usr/lib/x86_64-linux-gnu -lrt
#
#libsoapy_la_LDFLAGS      = -export-symbols-regex '^soapy_[^_]' -fPIC           \
#                           -shared -pthread                                    \
#                           -L/usr/lib/x86_64-linux-gnu -lrt

pkginclude_HEADERS       = 

## *EOF*
