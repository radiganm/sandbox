#!/bin/bash
## quickplot-house.sh

echo -e "-10 8 -8 1 -1.5 -6\n-10 -6 -4 1 1.5 -6\n\
10 -6 -4 5 1.5 3\n10 8 -8 5 -1.5 3\nnan nan -8 1 -1.5 -6\n\
-13 8 nan nan\n13 8 4 1\n0 20 8 1\n-13 8 8 5\nnan nan 4 5\n\
nan nan 4 1" | quickplot -P --line-width=2 --no-grid \
--no-border --cairo-draw -C 'rgba(0,0,0,0)' --no-gui \
--no-points --geometry 79x87 -F -g "0 1 2 3 4 5"

## *EOF*
