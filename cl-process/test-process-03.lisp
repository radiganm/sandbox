#!/bin/sh
#|
exec sbcl --script $0 $0 ${1+"$@"}
exit
|#
;; test-process-03.lisp
;; Mac Radigan


  (defun test () 
    ""
    (let ((p1 (run-program "/bin/sh" '("-c" "/usr/bin/seq 0 5 50 |sed 's/5/2/g' | grep 42")
                           :wait nil 
                           :output :stream))) 
      (let ((in (process-output p1)))
        (when in
          (loop for line = (read-line in nil)
             while line do (format t "~A~%" line))
          (close in))) ))

  (print (test))

;; *EOF*
