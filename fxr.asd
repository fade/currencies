;; -*-lisp-*-
;;;; fxr.asd

(asdf:defsystem #:fxr
  :description "interface to a currency conversion API"
  :author "Brian O'Reilly <fade@deepsky.com>"
  :license "Modified BSD License"
  :serial t
  :depends-on (#:drakma
               #:cl-json
               #:cl-ppcre
               #:net.didierverna.clon
               #:simple-date-time
               #:flexi-streams)
  :pathname "./"
  :components ((:file "app-utils")
               (:file "fxr")
               (:file "config")))

