#!/usr/bin/make
## makefile
## Mac Radigan

.PHONY: default doc

.DEFAULT_GOAL := default

target = xpiano

default: latex

latex:
	env TEXINPUTS=./xpiano:$(TEXINPUTS) \
	  pdflatex                          \
	    -interaction=batchmode          \
	    -shell-escape $(target).tex     \
	    -o $(target).pdf

view:
	@zathura -x a $(target).pdf 1>/dev/null 2>/dev/null

clobber: clean
	-rm -f $(target).pdf

clean:
	-rm -f $(target).txt
	-rm -f $(target).aux
	-rm -f $(target).log
	-rm -f $(target).out
	-rm -f $(target).aux
	-rm -f $(target).ps
	-rm -f $(target).dvi

## *EOF*
