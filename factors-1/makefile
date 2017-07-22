#!/usr/bin/make -f
## makefile
## Copyright 2017 Mac Radigan
## All Rights Reserved

.PHONY: default init convert

.DEFAULT_GOAL := default

target  := tesselation_18
#target  := factors_15_5_3
#target  := factors_15_3_5
#target  := factors_18_3_2_3
#target  := powers_9_3
#target  := powers_27_3
figures := ./figures

default: view

doc: metapost

metapost: init
	mpost $(target)
	epstopdf --outfile=$(figures)/$(target)-1.pdf $(figures)/$(target)-1.mps

pandoc: metapost
	pandoc $(target).md                           \
	     --wrap=preserve                          \
	     --template=../../include/template.tex    \
	     -f markdown                              \
	     -F pandoc-minted                         \
	     -t latex                                 \
	     -o $(target).tex
	pdflatex --shell-escape $(target).tex

init:
	mkdir -p $(figures)

view: doc
	@zathura -x a $(figures)/$(target)-1.pdf 1>/dev/null 2>/dev/null
	@#zathura -x a $(target).pdf 1>/dev/null 2>/dev/null

clobber: clean
	-rm -f $(target).pdf

clean:
	-rm -f $(target).tex
	-rm -f $(target).aux
	-rm -f $(target).log
	-rm -f $(target).out
	-rm -f $(target).aux

## *EOF*
