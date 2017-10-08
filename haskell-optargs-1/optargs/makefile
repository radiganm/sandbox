#!/usr/bin/make -f
## makefile (for stack)
## Mac Radigan

.PHONY: build clean run install test
.DEFAULT_GOAL := build

target = optargs

default: build

build:
	stack $@

install:
	stack $@

clean:
	stack $@

run:
	~/.local/bin/$(target)-exe

test:
	~/.local/bin/$(target)-exe --foo 3 --bar 1.618 --baz some_cat --huh
	~/.local/bin/$(target)-exe --foo 3 --bar 1.618 --baz some_cat

## *EOF*
