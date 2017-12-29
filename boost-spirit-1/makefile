#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean run
.DEFAULT_GOAL := all

all: build

CC       = g++
CCFLAGS := -O3 -std=c++1z

OBJS =         \
	employee.o  
  
BINS = $(OBJS:.o=)

build: $(OBJS)

%.o : %.cc
	$(CC) -c $(CCFLAGS) $(CPPFLAGS) $< -o $@
	$(CC) -o $(@:.o=) $@

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

run:
	cat employee.input| ./employee

packages-apt:
	apt-get install -y build-essential boost-dev

## *EOF*
