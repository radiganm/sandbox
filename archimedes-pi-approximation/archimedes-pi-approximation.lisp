#|
exec sbcl --noinform --load $0 --end-toplevel-options "$@"
|#
;; archimedes-pi-approximation.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

  (setf *read-default-float-format* 'double-float)

  (defun pi-approx (s e2 k) 
    "approximation for pi from n-gon perimiter construction"
    (let* (
      (sk  (* 2.0d0 s))
      (e2k (- 2.0d0 (* 2.0d0 (expt (- 1.0d0 (/ e2 4.0d0)) (/ 1.0d0 2.0d0)))))
      (api (* sk (expt e2k (/ 1.0d0 2.0d0))))
    ) ; let:bind
      (if (= k 1)
        api
        (progn
          (pi-approx sk e2k (- k 1))
        ) ; progn
      ) ; if
    ) ; let
  ) ; pi-approx

  (defun main ()
    (let* (
       (n 14)
       (api (pi-approx 2.0d0 2.0d0 n))
     ) ; let:bind
     (format *standard-output* "    ~~pi: ~a (~a iterations) ~% " api n)
     (format *standard-output* "    pi: ~a~% "  pi)
     (format *standard-output* " error: ~a~% "  (- api pi))
     (finish-output *standard-output*)
     (finish-output *error-output*)
   ) ; let*
  ) ; main

  (main)
  (quit)

;; *EOF*
