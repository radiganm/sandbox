#!/usr/bin/make -f
## makefile (for jack2_midi_dump)

target := jack2_midi_dump

build:
	gcc -o $(target) -Wall $(target).c -ljack -pthread

clean:
	-rm -f ./$(target)

## *EOF*
