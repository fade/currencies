;; -*-lisp-*-
(defpackage :fx
            (:use :cl)
            (:use :fx.app-utils :drakma :cl-json :cl-ppcre :flexi-streams)
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

(defun latest (base &rest currs)
  "Get the latest exchange rates for currs vs. base"
  (let* ((qstring
           (format nil "?access_key=~A&base=~A&symbols=~{~A~^,~}" *fixer-access-token* base currs))
         (qurl (format nil "~A/~A" *fixer-latest* qstring)))
    (princ qurl)
    (terpri)
    (cl-json:decode-json-from-string
     (octets-to-string (drakma:http-request qurl)))))
