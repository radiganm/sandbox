#!/usr/bin/make -f
## makefile

.PHONY: packages-apt build clean run test
.DEFAULT_GOAL := all

port = 9876

all: build

target = echo_server

build: $(target)

$(target): $(target).cc
	gcc -O3 -L/usr/lib/x86_64-linux-gnu -levent $< -o  $@

run:
	./$(target)

test:
	telnet localhost $(port)

clean:
	-rm -f ./$(target)

packages-apt:
	apt-get install -y build-essential

## *EOF*
