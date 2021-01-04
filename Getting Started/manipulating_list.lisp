;; Manipulating Lists


;; Return first element of list with `first'
(first '(23 34 45))
;; or `car'
(car '(23 34 45))

;; Return all but the first element with `rest'
(rest '(23 34 45))
;; or `cdr'
(cdr '(23 34 45))

;; Return the nth element with `nth'
(nth 1 '(23 34 45))
;; note: lisp is 0-indexed with some exceptions like `first'

;; Finding the length of list with `length'
(length '(1 2 3))

;; Constructing lists with `cons'
;; takes two parameters: object and list, return a new list
;; with the ojbect added to the first
(cons 1 '(2 3 4 5 6))
;; here, 1 is the object and (2 3 4 5 6) is the list
;; notice that 1 was prepended not appending to the list
;; note that the object can be a list itself
(cons '(0 1) '(2 3 4 5 6))

;; Joining list with `append'
;; join many lists into one list
(append '(1 3 5 6) '(2 4 6 8))


;; Reverse a list with `reverse'
(reverse '(1 2 3 4))


;; Combiing list procedures

;; create a `insert' procedure that inserts an item
;; between the first and second items
;; for example, (insert 2 '(1 3 4 5 6 )) should give
;; (1 2 3 4 5 6)
(defun  insert  (item lst)
  (cons (first lst)
        (cons item
              (rest lst))))

(insert 2 '(1 3 4 5 6))

;; Exercises

;; 1. Swap the first two items in a list
;; write a procedure `swap' to exchange the first tow items of a list
;; check that (swap '(9 8 7 6)) = (8 9 7 6)
(defun  swap (lst)
  (let* ((fst (nth 0 lst))
         (snd (nth 1 lst))
         (end (rest (rest lst)))
         (result (append (list snd fst) end)))
    result))

(swap '(9 8 7 6))


;; 2. Duplicate the first item ina list
;; write a procedure `dup' so that
;; (dup '(0 1 2 3)) = (0 0 1 2 3)
(defun  dup (lst)
  (cons (nth 0 lst) lst))

(dup '(0 1 2 3))


;; 3. Return a random item from a list
;; write a procedure  `random-elt' so that
;; (random-elt '(11 22 33 44)) = 11 or 22 or 33 or 44 randomly
(defun  random-elt (lst)
  (let* ((len (length lst))
         (n (random len))
         (result (nth n lst)))
    result))

(random-elt '(11 22 33 44))


;; 4. Return the last item in a list
;; write a procedure `last-elt' so that
;; (last-elt '(1 2 3 4)) = 4
(defun last-elt (lst)
  (first (reverse lst)))

(last-elt '(1 2 3 4))
