#!/usr/bin/make -f
## sender.mk

.PHONY: packages-apt build clean run
.DEFAULT_GOAL := all

all: build

target = sender

CC       = g++
CCFLAGS := -O3 -std=c++1z
LDFLAGS := -lboost_system -pthread

OBJS =         \
	$(target).o  
  
BINS = $(OBJS:.o=)

build: $(target)

$(target): $(OBJS)
	$(CC) -o $(@:.o=) $(OBJS) $(LDFLAGS) 

%.o : %.cc
	$(CC) -c $(CCFLAGS) $(CPPFLAGS) $< -o $@

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

run:
	./$(target) 224.0.0.1

packages-apt:
	apt-get install -y build-essential boost-dev

## *EOF*
