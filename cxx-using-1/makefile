#!/usr/bin/make -f
## makefile

.PHONY: bootstrap build clean
.DEFAULT_GOAL := all

all: build

build:
	g++ -O3 -std=c++1z -o cxx_using cxx_using.cc

clean:
	-rm -f ./cxx_using

packages-apt:
	apt-get install -y build-essential

## *EOF*
