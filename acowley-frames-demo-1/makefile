#!/usr/bin/make -f
## makefile (for Haskell acowley Frames demo)
## Mac Radigan

target := demo

.PHONY: demo

demo: Frames
	(cd ./Frames; cabal sandbox init)
	(cd ./Frames; cabal install --dependencies-only -f demos)
	(cd ./Frames; cabal configure -f demos)
	(cd ./Frames; cabal run getdata)
	(cd ./Frames; cabal run plot)

Frames:
	git clone https://github.com/acowley/Frames.git

## *EOF*
