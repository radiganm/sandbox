#!/usr/bin/make -f
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

.PHONY: bootstrap build dasm clean generate
.DEFAULT_GOAL := all

all: dasm

build: generate
	gcc -O3 -o hello hello.s
	gcc -O3 -o hello_from_gcc hello_from_gcc.s

clean:
	-rm -f ./hello
	-rm -f ./hello_from_gcc

generate:
	gcc -O3 -S -o hello_from_gcc.s hello_from_gcc.c

dasm: build
	r2 -c 'Vp' hello
	@#r2 -c 'Vp' hello_from_gcc

packages-apt:
	apt-get install -y build-essential
	apt-get install -y radare2

## *EOF*
