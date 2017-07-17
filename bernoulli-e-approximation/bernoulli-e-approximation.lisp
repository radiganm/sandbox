#|
exec sbcl --noinform --load $0 --end-toplevel-options "$@"
|#
;; bernoulli-e-approximation.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (setf *read-default-float-format* 'double-float)

  (defun main ()
    (let* (
       (n 1e8)
       (ae (expt (+ 1.0d0 (/ 1.0d0 n)) n))
     ) ; let:bind
     (format *standard-output* "     ~~e: ~a (with limit ~0$) ~% " (exp 1) n)
     (format *standard-output* "     e: ~a~% "  (exp 1))
     (format *standard-output* " error: ~a~% "  (- ae (exp 1)))
     (finish-output *standard-output*)
     (finish-output *error-output*)
   ) ; let*
  ) ; main

  (main)
  (quit)

;; *EOF*
