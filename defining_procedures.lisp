;; Defining a procedure

;; use 'defun' operator to "define a function"
;; example: average
(defun average (1st-number 2nd-number)
  (/ (+ 1st-number 2nd-number) 2))

;; a procedure doesn't need parameters
;; example: dice
(defun dice ()
  (+ 1 (random 6)))

;; Exercises
;; 1. Square a number
;;  define a procedure that returns square of a number
;;  (square 7)
(defun square (n)
  (* n n))

;; 2. find the nth triangular number
;;   define a procedure triangluar that gives
;;   the nth triangluar number: n(n+1)/1
;;   (triangluar 10)
(defun triangular (n)
  (/ (* n (+ n 1)) 2))

;; 3. find the result of throwing two dice
;;    define a procedure two-dice that returnst the
;;    total results of throwing two dice
(defun two-dice ()
  (+ (+ 1 (random 6))
     (+ 1 (random 6))
     )
  )

;; try quoting this
(defun q-two-dice()
  (quote (+ (+ 1 (random 6))
            (+ 1 (random 6))
            )
         )
  )
