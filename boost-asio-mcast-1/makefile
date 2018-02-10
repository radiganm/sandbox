#!/usr/bin/make -f
## makefile

.PHONY: packages-apt build clean run
.DEFAULT_GOAL := all

all: build

build:
	$(MAKE) -f receiver.mk
	$(MAKE) -f sender.mk

packages-apt:
	apt-get install -y build-essential boost-dev

## *EOF*
