;; -*-lisp-*-
(defpackage :fx
            (:use :cl)
            (:use :fx.app-utils)
            (:export :-main))

(in-package :fx)

(defun -main (&optional args)
  (format t "~a~%" "I don't do much yet"))



(defun now (&key (now))
  "return the present YYYY-MM-DD date unless given something, in which
   case that is returned."
  (if now
      now
      (simple-date-time:YYYY-MM-DD (simple-date-time:from-universal-time (get-universal-time)))))
