#!/usr/bin/make -f
## makefile

.PHONY: packages-apt build clean
.DEFAULT_GOAL := all

all: build

build: tecla_search

tecla_search: tecla_search.c
	gcc -O3 -l tecla $< -o  $@

clean:
	-rm -f ./tecla_search

packages-apt:
	apt-get install -y build-essential

## *EOF*
