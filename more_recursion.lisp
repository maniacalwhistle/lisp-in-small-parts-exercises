;; More about Recursion

;; Recursion on trees
;; example with a simple game:
;; 1. one player names an initial letter
;; 2. each player takes turn adding a letter to either end to make a word
;; 3. first player unable to make a word loses

;; represent possible choices as a tree, which is represented as a list
;; (word left-branch right-branch)
;; exmaple tree:
;; note: when a branch is empty we put 'nil'
(defparameter tree
  '("n"
    ("in"
     ("pin"
      ("spin" nil nil)
      ("pint" nil nil))
     ("ink"
      ("sink" nil nil)
      ("inky" nil nil)))
    ("on"
     ("son"
      ("sons" nil nil)
      ("song" nil nil))
     ("one"
      ("gone" nil nil)
      ("ones" nil nil)))))

;; what if you wanted to print this tree?

;; to print tree:
;;  1. print the word at the top of the tree
;;  2. print the left branch
;;  3. print the right branch
(defun print-tree (tree)
  (if (null tree)
      nil
      (progn
        (print (first tree))
        (print-tree (second tree))
        (print-tree (third tree)))))

(print-tree tree)


;; Recursion with numbers

;; factorial can be expressed via recursion
;;  - factorial(n) = factorial(n - 1) * n
;;      where factorial(1) = 1
(defun factorial (n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

(factorial 10)


;; Exercises

;; 1. Count the items on a tree
;; write a procedure `count-tree' so that
;; (count-tree tree) = number of items on a tree
;; using tree above, this should equal 15
(defun count-tree (tree)
  (if (null tree)
      0
      (+ 1
         (count-tree (second tree))
         (count-tree (third tree)))))

(count-tree tree)


;; 2. Find an item on a tree
;; write a procedure `find-tree' that checks whether a word is on the tree
;; (find-tree tree "gone") = T
;; (find-tree tree "tins") = NIL
(defun find-tree (tree word)
  (if (or (null tree) (null word))
      nil
      (if (or (string= word (first tree))
              (find-tree (second tree) word)
              (find-tree (third tree) word))
          t
          nil)))

(find-tree tree "gone")


;; 3. Find the nth fibonacci number
;; write a procedure `fib' so that
;; (fib 10) = 55
(defun fib (n)
  (if (<= n 2)
      1
      (+ (fib (- n 1)) (fib (- n 2)))))

(fib 10)


;; Find a specified number on Pascal's triangle
(defun pascal (n r)
  (if (or (= r 1)
          (= n 1))
      1
      (+ (pascal n (- r 1))
         (pascal (- n 1) (- r 1)))))

(defun pascal-actual (n r)
  (if (= n 1) 1
      (if (= n r) 1
          (+ (pascal-actual (- n 1) (- r 1))
             (pascal-actual n (- r 1))))))

(pascal 3 5)
(pascal-actual 3 5)
;; I was pretty close but didn't get it
;; need to fix my condition for catching the right-side
;; of the triangle
