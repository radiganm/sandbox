#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean
.DEFAULT_GOAL := all

all: build

#CC       = g++
CC       = gcc
CCFLAGS := -O3 -std=c++1z

OBJS =             \
	inotify_dtree.o
  
BINS = $(OBJS:.o=)

build: $(BINS)

%.o : %.cc
	$(CC) -c $(CCFLAGS) $(CPPFLAGS) $< -o $@
	$(CC) -o $(@:.o=) $@

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

packages-apt:
	apt-get install -y build-essential

## *EOF*
