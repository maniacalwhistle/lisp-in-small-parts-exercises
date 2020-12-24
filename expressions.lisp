;; Expressions

;; Preventing evaluation

;; normally lisp will evaluate a procedure
;; like:
(+ 2 2)

;; but sometimes you don't want that
;; quote behave differntly
(quote (+ 2 3))
;; this returns the expression instead of evaluating it
;; the experession can be treated as data

;; shorthand to quote is to use ' symbol
'(+ 2 3)

;; try quoting an argument
(list '(* 1 2) (* 3 4))


;; Evaluating expressions with eval

;; opposite of quote is eval, which evalutes the expression passed in as argument
(eval '(+ 2 3))

;; a number evaluates to itself
12

;; nil does to
()
nil


;; Exercises

;; 1. Predict what the following Lisp experessions will give

;; (list (list 2 3) (list 4 5))
;; prediction:
;; ((2 3) (4 5))
(eval '(list (list 2 3) (list 4 5)))

;; (list '(list 2 3) '(list 4 5))
;; prediction:
;; ((list 2 3) '(list 4 5))
(eval '(list '(list 2 3) '(list 4 5)))

;; '(list (list 2 3) (list 4 5))
;; prediction:
;; (list (list 2 3) (list 4 5))
(eval '(list (list 2 3) (list 4 5)))
