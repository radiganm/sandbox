#!/usr/bin/make -f

.PHONY: build clean run install
.DEFAULT_GOAL := default

target := interpreter

args := 

default: run

build_opts := -v

build:
	stack $@ $(build_opts)

install: build
	stack $@

clean:
	stack $@

run: install
	~/.local/bin/$(target)-exe $(args)

## *EOF*
