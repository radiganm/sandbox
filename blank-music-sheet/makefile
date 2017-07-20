#!/usr/bin/make -f
## makefile (for blank-music-sheet)
## Mac Radigan

.PHONY: convert packages-apt clobber clean

.DEFAULT_GOAL := convert

LILY_FILES =                \
  blank-music-sheet-001.ly  \
  blank-music-sheet-002.ly

PDF_FILES = $(LILY_FILES:.ly=.pdf)

convert: $(PDF_FILES)

%.midi: %.abc
	abc2midi $<

%.ly: %.abc
	abc2ly $<

%.pdf: %.ly
	lilypond $<

packages-apt:
	sudo apt-get install -y abcmidi
	sudo apt-get install -y lilypond
	sudo apt-get install -y timidity
	sudo apt-get install -y zathura

clobber: clean
	-rm -f *.pdf

clean:
	-rm -f *.ly

## *EOF*
