;; Strings


;; This is data: (1 2 3 4)
;; This is a procedure: (+ 1 2 3)
;; This is a string: "cat", "dog", "", "Hello world"

;; Finding length of string with `length'
(length "Lisp")

;; Reversing a string with `reverse'
(reverse "dog")

;; Join two or more strings with `concatenate'
(concatenate 'string "band" "age")

;; Get subsequence from string with `subseq'
(subseq "averylongword" 5 9)
;; try leaving out the 3rd (end) parameter
(subseq "averylongword" 5)


;; Write a procedure using strings
;; `piglatin'
;; it takes first letter of word
;; then concatenates it to the word with the first letter removed
;; and adds "ay" on the end
(defun piglatin (word)
  (concatenate 'string (subseq word 1) (subseq word 0 1) "ay"))

;; good
(piglatin "pig")

;; not so good
(piglatin "ant")


;; Exercises

;; 1. Reverse the middle letters of a word
;; write a procedure `midverse' so that
;; (midverse "retinues") = "reunites"
;; by reverse all but first and last letter
(defun midverse (word)
  (concatenate 'string
               (subseq word 0 1)
               (reverse (subseq word 1 (- (length word) 1)))
               (subseq (reverse word) 0 1)))

(midverse "retinues")

;; 2. Rotate a string n places to the left
;; write a procedure `rotate' so that
;; (rotate "mousetrap" 5) = "trapmouse"
;; by rotate a string n characcters to the left
(defun rotate (word n)
  (concatenate 'string
               (subseq word n)
               (subseq word 0 n)))

(rotate "mousetrap" 5)
(rotate "ace" 2)
(rotate "poop" 4)
