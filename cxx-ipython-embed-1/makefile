#!/usr/bin/make -sf
### makefile
###
### Copyright 2017 Mac Radigan
### All Rights Reserved

.PHONY: init clean clobber run test
.DEFAULT_GOAL := all

BLDDIR=./build

target = test_embed

library = pyembed

all: init build

CCC = g++
CYC = cython3
PYC = python3

BINDIR=bin
SCRIPTDIR=scripts

CYSRC = \
  library/shell/Embed.py

CYAPPS = \
  $(target).py
CYBINS = $(patsubst %,$(BINDIR)/%, $(CYAPPS:.py=))

build: $(CYBINS)

$(BINDIR)/$(target): $(target).py lib$(library).a
	$(CYC) -a library/shell/Embed.py
	$(CYC) --embed -a $(target).py
	$(CCC) -o $@ $(target).c ./library/shell/Embed.c -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python3.5 -L/usr/lib/x86_64-linux-gnu -lpython3.5m -L. -l$(library)
	@#$(CCC) -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python3.5 -o $(BINDIR)/$(target) $(target).c

lib$(library).a: $(CYSRC)
	$(PYC) setup.py

init:
	-mkdir -p $(BINDIR)

clobber: clean
	-rm -f $(CYBINS)
	-rm -f *.a

clean:
	-rm -f *.o
	-rm -f *.c
	-rm -f *.html

run:
	$(SCRIPTDIR)/$(target)

test:
	$(MAKE) -C ./tests

## *EOF*
