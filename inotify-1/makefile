#!/usr/bin/make -f
## makefile

.PHONY: packages-apt build clean
.DEFAULT_GOAL := all

all: build

target = inotify_test

build: $(target)

$(target): $(target).c
	gcc -O3 $< -o  $@

clean:
	-rm -f ./$(target)

packages-apt:
	apt-get install -y build-essential

## *EOF*
