#!/usr/bin/env stack

-- reference: http://oeis.org/A046109
-- Reinhard Zumkeller, Jan 23 2012

a046109 n = length [(x, y) | x <- [-n..n], y <- [-n..n], x^2 + y^2 == n^2]

main :: IO () 
main = print $ map a046109 [1..50]

-- *EOF*
