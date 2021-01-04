;; make a list by enclosing atoms in brackets/parens
(16 25 36 39 64 81)

;; empty list or 'nil'
()

;; here is a list of four items/atoms
(+ 2 3 4)

;; in this case '+' is the procedure
;; other items are the arguments
;; lisp programs and lisp data are expressed the same way


;; Building a List

;; use 'list' procedure to build list
(list 1 2 3)

;; note that the arguments are evaluated first
(list (* 1 2) (* 3 4))

;; items in list can be lists themselves
(list (list 1 2) (list 3 4))
;; above is a 2 item list and each item is a list


;; Exercises

;; 1. write an expression that will construct this list:
;; (1 (2 (3 4)))

(list 1 (list 2 (list 3 4)))

;; 2. write an expression that will construct a list
;; of two random numbers, each from 0 to 9
(list (random 10) (random 10))
