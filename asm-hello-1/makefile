#!/usr/bin/make -f
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: bootstrap build dasm clean
.DEFAULT_GOAL := dasm

build:
	gcc -O3 -o hello hello.s

clean:
	-rm -f ./hello

dasm: build
	r2 -c 'Vp' hello

packages-apt:
	apt-get install -y build-essential
	apt-get install -y radare2

## *EOF*
