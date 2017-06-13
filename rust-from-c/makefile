#!/usr/bin/make -f

.PHONY: build build-static build-shared clean run
.DEFAULT_GOAL := build

default: build

target := rstest

build: build-static

build-static:
	gcc -o caller -L./$(target)/target/debug/lib$(target).a caller.c

build-shared:
	gcc -o caller -L./$(target)/target/debug -l$(target) caller.c

clean:
	$(MAKE) -C $(target) $@
	-rm -f ./caller

run:
	./caller

## *EOF*
