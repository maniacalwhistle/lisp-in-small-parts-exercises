;; Variables


;; Consider a function that converts dollars to pounds
;; 'mutiply number of dollars by exchange rate'

(defun convert (dollars)
  (* dollars 0.61)
  )
;; dollars is a "local variable",
;; accessible only to body of function

;; defining a variable with defparameter
;; instead of changing exchange rate in function
;; define a variable that is set as "global variable"
(defparameter exchange-rate 0.61)

(defun convert (dollars)
  (* dollars exchange-rate))


;; changing the value of a variable with setf
;; let's say we want exchange rate to be
;; 0.7
(setf exchange-rate 0.7)


;; creating local variables with let*
;; let define one or more variables local to the body
;; of the let construction
;; (let* ((var1 value1)
;;        (var2 value2)
;;        ...)
;;   body)

;; example with "average"
;; (defun average (a b)
;;   (/ (+ a b)
;;      2))
;; break into steps with let*
(defun average (a b)
  (let* ((sum (+ a b))
         (result (/ sum 2))
         )
    result))


;; Exercises
;; 1. Convert between km and miles
;; define variable using defparameter where
;; 1 km = 0.621371192
;; define procedures 'convert-km' and 'convert-miles'
(defparameter km-to-mi 0.621371192)

(defun convert-km (miles)
  (* miles
     (/ 1 km-to-mi)))

(defun convert-miles (km)
  (* km
     km-to-mi))

;; 2. Find the average of 3 numbers
;; define procedure average3 that finds the average of three numbers
(defun average3 (a b c)
  (let* ((sum (+ a b c))
         (result (/ sum 3)))
    result))

;; 3. Cube the sume of two numbers
;; using the following procedure that computes:
;; (a + b) * (a + b) * (a + b)
(defun cubesum (a b)
  (* (+ a b)
     (+ a b)
     (+ a b)))
;; use let so that (a + b) is only calculated once
(defun cubesum (a b)
  (let* ((sum (+ a b))
         (result (* sum sum sum)))
    result))


;; 4. Subtitute values into a quadratic equation
;; write a procedure "pseudo-primes" that substitutes x into
;; x^2 - x + 41

(defun pseudo-primes (x)
  (let* ((term1 (* x x))
         (result (+ (- term1 x) 41)))
    result))
