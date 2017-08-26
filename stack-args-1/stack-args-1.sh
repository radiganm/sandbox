#!/bin/bash

  d=${0%/*}; f=${0##*/}; n=${f%.*}; e=${f##*.}
  $d/stack-args-1.lhs a b c $*
