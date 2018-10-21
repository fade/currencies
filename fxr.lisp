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
  "Get the latest exchange rates for pairs of CURRS"
  (let* ((qstring
           (format nil "?&pairs=~{~A~^,~}&api_key=~A" currs *fxr-access-token*)) ;;
         (qurl (format nil "~A~A" *fxr-quotes-url* qstring)))
    (princ qurl)
    (terpri)
    (cl-json:decode-json-from-string
     (octets-to-string (drakma:http-request qurl)))))

(defun get-fxsymbols-list (&key raw)
  "Get a list of all the available currency trading pairs."
  (let* ((qstring
           (format nil "?api_key=~A" *fxr-access-token*))
         (qurl (format nil "~A~A" *fxr-symbols-url* qstring)))
    (princ qurl)
    (terpri)
    (if raw
        (octets-to-string (drakma:http-request qurl))
        (cl-json:decode-json-from-string
         (octets-to-string (drakma:http-request qurl))))))

(defun convert-pairs (base targ quantity)
  "return the value of QUANTITY BASE in terms of TARG."
  (let* ((qstring
           (format nil "?from=~A&to=~A&quantity=~A&api_key=~A" base targ quantity *fxr-access-token*))
         (qurl (format nil "~A~A" *fxr-convert-url* qstring)))
    (princ qurl)
    (terpri)
    (cl-json:decode-json-from-string
     (octets-to-string (drakma:http-request qurl)))))

(defun is-market-open? (&key raw)
  (let* ((qstring
           (format nil "?api_key=~A" *fxr-access-token*))
         (qurl (format nil "~A~A" *fxr-market-status* qstring)))
    (princ qurl)
    (terpri)
    (if raw
        (octets-to-string (drakma:http-request qurl))
        (cl-json:decode-json-from-string
         (octets-to-string (drakma:http-request qurl))))))

(defun quota-check ()
  "return the remaining quota for current 24 hour period."
  (let* ((qstring
           (format nil "?api_key=~A" *fxr-access-token*))
         (qurl (format nil "~A~A" *fxr-quota* qstring)))
    (cl-json:decode-json-from-string
         (octets-to-string (drakma:http-request qurl)))))

;;===============================================================================
;; Commandline machinery follows
;;===============================================================================

(defun -main (&optional args)
  (format t "~a~%" "I don't do much yet"))


