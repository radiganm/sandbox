#!/usr/bin/make -f
## makefile (for stack)

.PHONY: build clean run install
.DEFAULT_GOAL := default

target := demo1

default: run

build_opts := -v

build:
	stack $@ $(build_opts)

install: build
	stack $@

clean:
	stack $@

run: install
	~/.local/bin/$(target)-exe

## *EOF*
