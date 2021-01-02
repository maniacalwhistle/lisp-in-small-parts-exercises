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
