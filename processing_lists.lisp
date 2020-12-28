;; Processing Items in a List


;; Finding sum of a list of numbers
;; write a program `sum-list' to find
;; sum of list of numbers so that we can call
;; (sum-list '(2 3 5 7 11 13 17 19)) and it will
;; return 77
;;
;; need to:
;;  - check if list is empty. if so, sum = 0
;;  - otherwise, answer is first number added to `sum-list' of remaining numbers
;;  in English, the function looks like:
;; (defun sum-list (numbers)
;;   (if (null numbers)
;;       0
;;       (+ (first numbers)
;;          (sum-list (rest numbers)))))


;; Doubling every number in a list
;; write a program `double-list' that creates a new list identical
;; to original list but with every element doubled
;; (double-list '(2 3 3 5 6 11 13 17 19))
;; need to:
;;  - check if list is empty. if so, nil.
;;  - otherwise, twice the first number followed by double list of rest of numbers
;; in English, the function is:
;; (defun double-list (numbers)
;;   (if (null (first numbers))
;;       nil
;;       (cons (* 2 (first numbers))
;;             (double-list (rest numbers)))))


;; Doing something for each element in a list with `dolist'
;; a built-in Lisp construct for conveniently performing a series
;; of operations on every element of a list.
;; (dolist (item list)
;;   body)
(dolist (i '(2 3 5 7 11))
  (print (* i 2)))


;; Exercises

;; 1. Count the number of elements in a list
;; write a procedure `count-list' so that
;; (count-list '(2 3 5 7 11 13 17 19)) = 8
(defun count-list (lst)
  (if (null (first lst))
      0
      (+ 1 (count-list (rest lst)))))

(count-list '(1 2 3))
(count-list '())
(count-list nil)


;; 2. Reverse each string in a list of strings
;; write a procedure `reverse-list' so that
;; (reverse-list '("dog" "pan" "tar" "tip" "net")) =
;; ("god" "nap" "rat" "pit" "ten")
(defun reverse-list (lst)
  (if (null (first lst))
      nil
      (cons (reverse (first lst))
            (reverse-list (rest lst)))))
(reverse-list '("dog" "pan" "tar" "tip" "net"))


;; 3. Find wheter each number in a list is even or odd
;; write a procedure `evenp-list' so that
;; (evenp-list '(1 2 3 4 5 6 7 8)) =
;; (nil t nil t nil t nil t)
(defun evenp-list (lst)
  (if (null (first lst))
      nil
      (cons (evenp (first lst))
            (evenp-list (rest lst)))))

(evenp-list '(1 2 3 4 5 6 7 8))


;; 4. Find the maximum element of a list
;; write a procedure `max-list' so that
;; (max-list '(11 13 17 19 2 3 5 7)) = 19
;; 1. if list is empty, then nil
;; 2. otherwise, compare first item with next item
;; 3. if first item > next item, drop next item and run `max-list' on remaining list
;; 4. if first item < next item, drop first item and run `max-list' on remaining lst
(defun max-list (lst)
  (if (null (first lst))
      nil
      (if (null (rest lst))
          (first lst)
          (if (> (first lst) (first (rest lst)))
              (max-list (cons (first lst) (subseq (rest lst) 1)))
              (max-list (rest lst))))))

(max-list '(20 11 13 0 12 14 11 100))


;; 5. Duplicate each element in a list
;; write a procedure `dup-list' so that
;; (dup-list '(a b c c d)) becomes
;; (a a b b c c c c d d)
(defun dup-list (lst)
  (if (null (first lst))
      nil
      (cons (first lst) (cons (first lst) (dup-list (rest lst))))))

(dup-list '(a b c c d))


;; 6. Eliminate consective duplicates in a list
;; write a procedure `compress' so that
;; (compress '(a a a a b c c a a d e e e e)) becomes
;; (A B C A D E)
(defun compress (lst)
  (if (null (first lst))
      nil
      (if (eq (first lst) (first (rest lst)))
          (compress (rest lst))
          (cons (first lst) (compress (rest lst))))))

(compress '(a a a a b c c a a d e e e e))
