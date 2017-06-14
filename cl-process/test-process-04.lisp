#!/bin/sh
#|
exec sbcl --script $0 $0 ${1+"$@"}
exit
|#
;; test-process-04.lisp
;; Mac Radigan


  (defun test () 
    ""
    (let* (
      (p (run-program "/bin/sh" '("-c" "sed 's/5/2/g' | grep 42")
                       :wait nil
                       :input  :stream
                       :output :stream))
      (pin (sb-ext:process-input p))
      (pout (sb-ext:process-input p))) 
      (prog
        (format pin "~A~%" "0 5 10 20 30 40 50")
        (finish-ouptut pin)
        (sb-ext:process-wait p)
        (close pin)
        (when pout
          (loop for line = (read-line out nil)
                while line do (format t "~A~%" line))
        (close pout)) ) ) )

  (print (test))

;; *EOF*
