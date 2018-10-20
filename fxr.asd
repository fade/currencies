;; -*-lisp-*-
;;;; fxr.asd

(asdf:defsystem #:fxr
  :description "interface to a currency conversion API"
  :author "Brian O'Reilly <fade@deepsky.com>"
  :license "Modified BSD License"
  :serial t
  :depends-on (#:DRAKMA
               #:CL-JSON
               #:CL-PPCRE
               #:NET.DIDIERVERNA.CLON
               #:SIMPLE-DATE-TIME
               #:FLEXI-STREAMS)
  :pathname "./"
  :components ((:file "app-utils")
               (:file "fxr")
               (:file "config")))

