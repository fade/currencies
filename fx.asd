;; -*-lisp-*-
;;;; fx.asd

(asdf:defsystem #:fx
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
               (:file "fx")
               (:file "config")))

