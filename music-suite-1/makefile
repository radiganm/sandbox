#!/usr/bin/make -f
## makefile (for stack)

.PHONY: build clean run install new
.DEFAULT_GOAL := default

target := demo1

default: run

build:
	$(MAKE) -C $(target) $@

install: build
	$(MAKE) -C $(target) $@

clean:
	$(MAKE) -C $(target) $@

run: install
	$(MAKE) -C $(target) $@

new:
	stack new $(target)

view:
	@zathura -x -a $(target).pdf 1>/dev/null 2>/dev/null

## *EOF*
