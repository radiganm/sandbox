#|
exec sbcl --script $0 $0 ${1+"$@"}
exit
|#
;; install-stumpwm.lisp
;; Mac Radigan

 ;(sb-ext:run-program "/usr/bin/env" '("curl" "-O" "https://beta.quicklisp.org/quicklisp.lisp"))
 ;(load #P"./quicklisp.lisp")
 ;(quicklisp-quickstart:install)
  (load #P"~/quicklisp/setup.lisp")

 ;(ql:add-to-init-file)

  (ql:quickload "cl-ppcre")
  (ql:quickload "alexandria")
  (ql:quickload "clx")

 ;(load #P"./make-image.lisp")

  (sb-ext:exit)

;; *EOF*
