;; -*- mode: lisp -*-

(defpackage :fxr
  (:use :cl)
  (:use :fxr.app-utils :drakma :cl-json :cl-ppcre :flexi-streams)
  (:export :-main))

(in-package :fxr)

(defun now (&key (now (get-universal-time)))
  "return the present YYYY-MM-DD date unless given something, in which
   case that is returned."
  (simple-date-time:YYYY-MM-DD (simple-date-time:from-universal-time now)))

(defun latest-pairs (&rest currs)
  "Get the latest exchange rates for currs vs. base"
  (let* ((qstring
           (format nil "?&pairs=~{~A~^,~}&api_key=~A" currs *fxr-access-token*)) ;;
         (qurl (format nil "~A~A" *fxr-quotes-url* qstring)))
    (princ qurl)
    (terpri)
    (cl-json:decode-json-from-string
     (octets-to-string (drakma:http-request qurl)))))

(defun get-fxsymbols-list ()
  "Get a list of all the available currency trading pairs."
  (let* ((qstring
           (format nil "?api_key=~A" *fxr-access-token*))
         (qurl (format nil "~A~A" *fxr-symbols-url* qstring)))
    (princ qurl)
    (terpri)
    (cl-json:decode-json-from-string
     (octets-to-string (drakma:http-request qurl)))))


;;===============================================================================
;; Commandline machinery follows
;;===============================================================================

(defun -main (&optional args)
  (format t "~a~%" "I don't do much yet"))


