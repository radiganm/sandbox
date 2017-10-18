#!/bin/bash
## music-suite.sh

  cabal update
  cabal get music-suite
  cd music-suite-1.9.0
  cabal sandbox init
  cabal install
  cabal repl

## *EOF*
