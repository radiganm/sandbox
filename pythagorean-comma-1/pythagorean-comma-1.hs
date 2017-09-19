#!/usr/bin/runhaskell
-- pythagorean-comma-1.hs
-- Mac Radigan

import Data.Ratio
import Data.Scientific

octave :: Integer -> Rational
octave n = (1 % 2)^n

fifth :: Integer -> Rational
fifth n = (3 % 2)^n

main :: IO ()
main = print $ fromRational ( (fifth 12) * (octave 7) )
