#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean run
.DEFAULT_GOAL := all

all: build

target = timerfd

CC       = g++
CCFLAGS := -O3 -std=c++1z
LDFLAGS := -lpthread

OBJS =         \
	$(target).o  
  
BINS = $(OBJS:.o=)

build: $(target)

$(target) : $(OBJS)
	$(CC) $(LDFLAGS) -o $(target) $<

%.o : %.cc
	$(CC) -c $(CCFLAGS) $(CPPFLAGS) $< -o $@

clean:
	-rm -f $(OBJS)
	-rm -f $(BINS)

run:
	./$(target)

packages-apt:
	apt-get install -y build-essential

## *EOF*
