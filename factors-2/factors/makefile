#!/usr/bin/make -f
## makefile (for stack)

.PHONY: build clean run install
.DEFAULT_GOAL := default

target := factors

default: run

build_opts := -v

build:
	stack $@ $(build_opts)

install: build
	stack $@

clean:
	stack $@

run: install
	~/.local/bin/$(target)-exe -o ../$(target).pdf -w 800 -h 80

view:
	@zathura -x -a ../$(target).pdf 1>/dev/null 2>/dev/null

## *EOF*
