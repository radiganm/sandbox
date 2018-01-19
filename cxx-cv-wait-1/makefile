#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean run
.DEFAULT_GOAL := all

all: build

target = my_wait

CC       = g++
CCFLAGS := -O3 -std=c++1z

OBJS =         \
	$(target).o  
  
BINS = $(OBJS:.o=)

build: $(OBJS)

%.o : %.cc
	$(CC) -fPIC -c $(CCFLAGS) $(CPPFLAGS) $< -o $@
	$(CC) -o $(@:.o=) $@ -ldl -lm -lrt -pthread

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

run:
	env LD_LIBRARY_PATH=/usr/local/lib64 ./$(target)

packages-apt:
	apt-get install -y build-essential boost-dev

## *EOF*

