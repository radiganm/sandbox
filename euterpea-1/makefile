#!/usr/bin/make -f
## makefile (for euterpea-1)
## Mac Radigan

.PHONY: euterpea-1 clean clobber run

.DEFAULT_GOAL := euterpea-1

euterpea-1: euterpea-1.hs
	ghc -o $@ -threaded $<

run:
	./euterpea-1

clean:
	-rm -f *.hi *.o

clobber: clean
	-rm -f euterpea-1

## *EOF*
