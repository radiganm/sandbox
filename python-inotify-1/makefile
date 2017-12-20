#!/usr/bin/make -f
## boostrap.mk (for inotify.py)

.PHONY: bootstrap packages-apt run
.DEFAULT_GOAL := run

run:
	python3 ./test_inotify.py

bootstrap: packages-apt

packages-apt:
	sudo pip  install inotify
	sudo pip3 install inotify

## *EOF*
