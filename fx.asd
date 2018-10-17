;; -*-lisp-*-
;;;; fx.asd

(asdf:defsystem #:fx
  :description "interface to the currency API at fixer.io"
  :author "Brian O'Reilly <fade@deepsky.com>"
  :license "Modified BSD License"
  :serial t
  :depends-on (#:DRAKMA
               #:CL-JSON
               #:CL-PPCRE
               #:NET.DIDIERVERNA.CLON
               #:SIMPLE-DATE-TIME)
  :pathname "./"
  :components ((:file "app-utils")
               (:file "fx")
               (:file "config")))

