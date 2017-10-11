compile: compile-c-dynamic compile-c-static

compile:
	ghc -O2 -dynamic -shared -fPIC -o libEval.so Eval.hs hsbracket.c -lHSrts-ghc7.10.3

compile-c-dynamic: compile
	gcc -O2 -c calculoader.c
	gcc -Wl,-rpath='$ORIGIN' -o calculoader calculoader.o -ldl

compile-c-static: compile
	gcc -O2 -c calculator.c
	gcc -o calculator calculator.o -L. -lEval -Wl,-rpath,'$ORIGIN'
