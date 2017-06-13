#!/bin/sh
#|
exec sbcl --script $0 $0 ${1+"$@"}
exit
|#
;; test-process-02.lisp
;; Mac Radigan


  (defun program-stream (program &optional args)
    (let ((process (sb-ext:run-program program args
                    :input :stream
                    :output :stream
                    :wait nil
                    :search t)))
    (when process
      (make-two-way-stream (sb-ext:process-output process)
                           (sb-ext:process-input process)))))

;; *EOF*
