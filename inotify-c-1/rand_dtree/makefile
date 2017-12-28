#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean run log generate
.DEFAULT_GOAL := all

all: build

#CC       = g++
CC       = gcc
CCFLAGS := -O3 -std=c++1z

OBJS =                 \
	rand_dtree.o       \
	error_functions.o

target = rand_dtree
  
BINS = $(OBJS:.o=)

build: $(target)

$(target) : $(OBJS)
	$(CC) -o $@ $(OBJS)

%.o : %.cc
	$(CC) -c $(CCFLAGS) $(CPPFLAGS) $< -o $@

run:
	-mkdir -p ./indir
	./$(target) -s 1000 ./indir cdm

log:
	lnav -c ':goto 100%' ./indir

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

generate:
	sh Build_ename.sh > ename.c.inc

packages-apt:
	apt-get install -y build-essential

## *EOF*
