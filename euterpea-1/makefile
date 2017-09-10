#!/usr/bin/make -f
## makefile (for euterpea-1)
## Mac Radigan

target := euterpea-1

.PHONY: $(target) clean clobber run play

.DEFAULT_GOAL := $(target)

$(target): $(target).hs
	ghc -o $@ -threaded $<

run: $(target)
	./$(target)

play: run
	timidity example.mid

clean:
	-rm -f *.hi *.o

clobber: clean
	-rm -f $(target)

## *EOF*
