;; Repeating Operations


;; Repeating a specified number of times
;; can write a recursive function
;; to do x some number of times
;; for example: `print-n'
;; will print "Hello" n times
(defun print-times (n)
  (if (= 0 n)
      nil
      (progn
        (print "Hello")
        (print-times (- n 1)))))

(print-times 5)


;; Repeating for a range of numbers
;; instead of counting down to zero
;; we may want to do x for a range of values
;; for example: `print-for'
(defun print-for (from to)
  (if (> from to)
      nil
      (progn
        (format t "~a^2 = ~a~%" from (* from from))
        (print-for (+ from 1) to))))

(print-for 15 20)


;; Try making a range between a and b
(defun range (from to)
  (if (> from to)
      nil
      (cons from (range (+ from 1) to))))

(defparameter aList (range 1 10))
(print aList)
