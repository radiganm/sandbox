#!/usr/bin/make -f
## makefile
## Mac Radigan

.PHONY: bootstrap bootstrap-python train predict

.DEFAULT_GOAL := predict

predict: train
	./mlp_predict.py

train:
	./mlp_train.py

bootstrap: bootstrap-python

bootstrap-python:
	python -m pip install tensorflow

## *EOF*
