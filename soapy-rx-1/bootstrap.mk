#!/usr/bin/make -f
## boostrap.mk

.PHONY: bootstrap package-apt
.DEFAULT_GOAL := bootstrap

bootstrap:
	autoreconf --force --install

packages-apt:
	sudo apt-get install -y autoconf
	sudo apt-get install -y automake
	sudo apt-get install -y libtool
	sudo apt-get install -y build-essential
	sudo apt-get install -y libgflags-dev

## *EOF*
