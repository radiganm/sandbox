#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean run
.DEFAULT_GOAL := all

all: build

target = number_list

CC       = g++
CCFLAGS := -O3 -std=c++1z

OBJS =         \
	$(target).o  
  
BINS = $(OBJS:.o=)

build: $(OBJS)

%.o : %.cc
	$(CC) -c $(CCFLAGS) $(CPPFLAGS) $< -o $@
	$(CC) -o $(@:.o=) $@

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

run:
	cat $(target).input| ./$(target)

packages-apt:
	apt-get install -y build-essential boost-dev

## *EOF*
