#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean run log
.DEFAULT_GOAL := all

all: build run

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

run:
	-mkdir -p ./indir
	./$(BINS) -v 5 -l ./$(BIN).log -x ./indir

log:
	lnav -c ':goto 100%' ./indir

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

packages-apt:
	apt-get install -y build-essential

## *EOF*
