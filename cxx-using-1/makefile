#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean
.DEFAULT_GOAL := all

all: build

CC       = g++
CCFLAGS := -O3 -std=c++1z

OBJS =             \
	cxx_using_1.o \
	cxx_using_2.o \
	cxx_using_3.o  
  
BINS = $(OBJS:.o=)

build: $(OBJS)

%.o : %.cc
	$(CC) -c $(CCFLAGS) $(CPPFLAGS) $< -o $@
	echo $(CC) -o $(@:.o=) $@

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

packages-apt:
	apt-get install -y build-essential

## *EOF*
