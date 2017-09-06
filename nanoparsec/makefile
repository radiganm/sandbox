#!/usr/bin/make -f

.PHONY: nanoparsec clean clobber run

.DEFAULT_GOAL := nanoparsec

nanoparsec: Nanoparsec.hs
	ghc -o $@ $<

run:
	./nanoparsec

clean:
	-rm -f *.hi *.o

clobber: clean
	-rm -f nanoparsec

## *EOF*
