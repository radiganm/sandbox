#!/usr/bin/env stack
-- stack --resolver lts-6.15 script
{-# LANGUAGE OverloadedStrings #-}

> import Euterpea
 
> main :: IO () 
> main = play $ line [c 4 qn, c 4 qn, g 4 qn, g 4 qn, a 4 qn, a 4 qn, g 4 hn]
