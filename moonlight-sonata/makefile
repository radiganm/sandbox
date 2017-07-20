#!/usr/bin/make -f
## makefile (for blank-music-sheet)
## Mac Radigan

.PHONY: convert packages-apt clobber clean

.DEFAULT_GOAL := convert

LILY_FILES =         \
  moonlight1-a4.ly   \
  moonlight1-let.ly  \
  moonlight2-a4.ly   \
  moonlight2-let.ly  \
  moonlight3-a4.ly   \
  moonlight3-let.ly   

MIDI_FILES =         \
  moonlight1.mid     \
  moonlight2.mid     \
  moonlight3.mid

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
