#!/bin/sh
#|
exec sbcl --script $0 $0 ${1+"$@"}
exit
|#
;; test-process-01.lisp
;; Mac Radigan


  (defun test () 
    ""
    (let ((p1 (run-program "/usr/bin/seq" '("0" "5" "50") 
                           :wait nil 
                           :output :stream))) 
      (unwind-protect 
        (with-open-stream (s (process-output p1)) 
          (let ((p2 (run-program "/bin/cat" '()
                                 :input s 
                                 :output :stream))) 
            (when p2 
              (unwind-protect 
                (with-open-stream (o (process-output p2)) 
                  (loop :for line := (read-line o nil nil) 
                        :while line 
                        :collect line)) 
                    (process-close p2))))) 
                    (when p1 (process-close p1))))) 

  (print (test))

;; *EOF*
