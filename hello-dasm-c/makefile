#!/usr/bin/make -f
## makefile
## Copyright 2016 Mac Radigan
## All Rights Reserved

dasm: dasm-g

dasm-o1: build-o1
	r2 -c 'Vp' hello-o1

dasm-o2: build-o2
	r2 -c 'Vp' hello-o2

dasm-o3: build-o3
	r2 -c 'Vp' hello-o3

dasm-g: build-g
	r2 -c 'Vp' hello-g

build: build-o1 build-o2 build-o2 build-g

build-o1:
	gcc -O1 -o hello-o1    \
	  hello.c              

build-o2:
	gcc -O2 -o hello-o2    \
	  hello.c              

build-o3:
	gcc -O3 -o hello-o3    \
	  hello.c              

build-g:
	gcc -g -o hello-g     \
	  hello.c              

## *EOF*
