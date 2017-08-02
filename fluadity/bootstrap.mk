#!/usr/bin/make -f
## boostrap.mk (for fluadity)

.PHONY: bootstrap packages-apt packages-luarocks
.DEFAULT_GOAL := bootstrap

bootstrap: packages-luarocks

packages-apt:
	sudo apt-get install -y luarocks

packages-luarocks: packages-apt
	sudo luarocks install fluidsynth
	sudo luarocks install midialsa
	sudo luarocks install luaposix

## *EOF*
