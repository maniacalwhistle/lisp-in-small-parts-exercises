;; Generalizing procedures

;; suppose we want to apply some function to a list
;; say we have a procedure `double'
(defun double-it (n)
  (* 2 n))

;; Calling a procedure with `funcall'
;; use `funcall' to apply a procedure with the arguments we specify
(funcall '+ 2 3)

;; another example:
(defun apply-list (function items)
  (if (null items)
      nil
      (progn
        (funcall function (first items))
        (apply-list function (rest items)))))

;; run `apply-list' with `print'
(apply-list 'print '(2 3 4 5 6))


;; Applying a function to make a new list with `change-list'
;; make a generalize version of `double-list'
(defun change-list (function items)
  (if (null items)
      nil
      (cons (funcall function (first items))
            (change-list function (rest items)))))

(change-list 'double-it '(2 3 4 5 6))
(change-list 'evenp '(2 3 4 5 6 7 8 ))


;; Exercises

;; 1. Repeat a procedure for a range of numbers
;; write a procedure `repeat-for' based on `print-for' so that
;; (repeat-for 4 7 'print) prints
;; 4
;; 5
;; 6
;; 7
(defun print-for (from to)
  (if (> from to)
      nil
      (progn
        (format t "~a^2 = ~a~%" from (* from from))
        (print-for (+ from 1) to))))

(defun repeat-for (from to function)
  (if (> from to)
      nil
      (progn
        (funcall function from)
        (repeat-for (+ 1 from) to function))))

(defun add-one (n)
  (print (+ 1 n)))
(repeat-for 4 10 'add-one)


;; 2. Combine a list of numbers using a binary operator
;; write a procedure `combine' so that
;; (combine '+ '(1 2 3 4)) returns 10
;; (combine '* '(1 2 3 4)) returns 24
(defun combine (operator numbers)
  (if (null numbers)
      (if (eq operator '+)
          0
          1)
      (funcall operator
               (first numbers)
               (combine operator (rest numbers)))))

;; actual answer
(defun combine (operator numbers)
  (if (null (third numbers))
      (funcall operator (first numbers) (second numbers))
      (funcall operator (first numbers) (combine operator (rest numbers)))))

(combine '* '(1 2 3 4))
