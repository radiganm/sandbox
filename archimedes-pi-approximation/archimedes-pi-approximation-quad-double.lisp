#|
exec sbcl --noinform --dynamic-space-size 3000 --load $0 --end-toplevel-options "$@"
|#
;; archimedes-pi-approximation-quad-double.lisp
;; Copyright 2016 Mac Radigan
;; All Rights Reserved

 ;(setf *read-default-float-format* 'double-float)
  (setf sb-impl::*default-external-format* :UTF-8)

  (require 'asdf)
  (setf asdf:*central-registry*
    (list* '*default-pathname-defaults* 
     #p"/opt/asdf-central-registry/dists/quicklisp/software/oct/"
     asdf:*central-registry*))
  (probe-file "quicklisp.asd")
  (probe-file "oct.asd")
  (gc :full t)
 ;(asdf:oos 'asdf:load-op :oct) ; compile
  (require 'oct)

  (defun pi-approx (s e2 k) 
    "approximation for pi from n-gon perimiter construction"
    (let* (
      (sk  (* #q2 s))
      (e2k (- #q2 (* #q2 (expt (- #q1 (/ e2 #q4)) (/ #q1 #q2)))))
      (api (* sk (expt e2k (/ #q1 #q2))))
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
       (api (pi-approx #q2 #q2 n))
     ) ; let:bind
     (format *standard-output* "    ~~pi: ~a (~a iterations) ~% " api n)
     (format *standard-output* "    pi: ~a~% "  +pi+)
     (format *standard-output* " error: ~a~% "  (- api +pi+))
     (finish-output *standard-output*)
     (finish-output *error-output*)
   ) ; let*
  ) ; main

  (main)
  (quit)

;; *EOF*
