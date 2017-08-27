#|
exec sbcl --noinform --load $0 --end-toplevel-options "$@"
|#
;; http-server.lisp
;; example from http://cl-cookbook.sourceforge.net/sockets.html

(in-package :port)

;;; Utilities

(defun http-send-line (stream line)
  "Send a line of text to the HTTP stream, terminating it with CR+LF."
  (princ line stream)
  (princ (code-char 13) stream)  ;; carriage-return
  (princ (code-char 10) stream)) ;; linefeed
;;; Server

(defun http-0.9-server (port root)
  "Run an HTTP/0.9 server on `port'. `root' is the pathname to the
directory where the HTML pages are stored."
  (let ((server (open-socket-server port)))
    (format t "> Started server on port ~d~%" port)
    (unwind-protect
        (loop
          (let ((socket (socket-accept server)))
            (unwind-protect
                (process-request socket
                                 (read-request socket)
                                 root)
              ;; Close connection when done
              (close socket))))
      
      ;; Close server before exiting
      (socket-server-close server))))

(defun read-request (socket)
  "Read an HTTP/0.9 request from `socket' and determine the
corresponding filename. An HTTP/0.9 request has the form:

GET /filename HTTP/0.9

Returns the filename, or NIL if the request is incorrect."
  
  (let ((request (read-line socket nil nil)))
    (when request
      (let ((p1 (position #\Space request))
            (p2 (position #\Space request :from-end t)))
        (when (and p1 p2)
          (subseq request (1+ p1) p2))))))

(defun process-request (socket filename root)
  (format t "> Received request from host ~a~%"
          (socket-host/port socket))
  ;; discard empty line
  (read-line socket)
  (if filename
      ;; Correct request, serve file
      (serve-file socket
                  (concatenate 'string root filename))
    ;; Incorrect request, return error
    (http-send-line socket "HTTP/0.9 400 Invalid HTTP Request."))
  
  ;; Make sure the client sees the output - not really
  ;; necessary since we close the socket right after this.
  (force-output socket))

(defun serve-file (socket pathname)
  "Write the contents of the file `pathname' to `socket'."
  ;; Does file exist?
  (if (probe-file pathname)
      
      ;; Yes, write it out to the socket
      (with-open-file (in pathname)
        (format t "> Serving file ~a...~%" pathname)
        (loop
          (let ((line (read-line in nil nil)))
            (unless line (return))
            (http-send-line socket line))))
    
    ;; No, return error
    (format socket "HTTP/0.9 401 Not found.~%")))

;;; Client

(defun http-get (server port path)
  "Send a request for file `path' to an HTTP/0.9 server on host
`server', port number `port'. Print the contents of the returned file
to standard output."
  ;; Open connection
  (let ((socket (open-socket server port)))
    (unwind-protect
        (progn
          (format t "> Sending request to ~a:~a...~%" server port)
          ;; Send request
          (http-send-line socket (format nil "GET ~a HTTP/0.9~%~%" path))
          (force-output socket)
          
          ;; Read response and output it
          (format t "> Received response:~%")
          (loop
            (let ((line (read-line socket nil nil)))
              (unless line (return))
              (format t "~a~%" line))))
      
      ;; Close socket before exiting.
      (close socket))))
