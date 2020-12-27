;; Testing a result


;; predicates: functions taht return true or false as a result
;; usually `nil' = false and `t' = true

;; testing lisp objects with `eq'
;; tests if two objects are identical
(eq 'fred 'fred)
(eq 'fred 'jim)

;; testing numbers with `=, > and <'
(= 2 2)
(eq 2 2)

(> 4 3)
(< 4 3)

;; are numbers even or odd with `evenp' and `oddp'
(evenp 17)
(oddp 17)


;; test if strings are equal with `string='
(string= "cat" "cat")
;; (eq "cat" "cat") <-- returns NIL

(string= "cat" "dog")


;; test if an object is number with `numberp'
(numberp 2)
(numberp "2")
(numberp '(1 2 3))
(numberp (list 1 2 3))

;; test if an object is a list with `listp'
(listp '(1 2 3))
(listp 1)
(listp nil) ;; nil is the empty list

(listp (+ 1 2))
;; is false but
(numberp (+ 1 2))
;; is true


;; test if an object is null or nil
(null nil)
(null t)
(null (list 1 2))


;; Conditional testing with `if'
;; if takes three parameters:
;;  1. evaluates first parameter
;;  2. if first = non-nil, then evaluate and return second parameter
;;  3. if first = nil, then evaluate and return third parameter
;; (if (evenp a)
;;     (print "Answer is even")
;;     (print "Answer is odd"))
(defun maximum (a b)
  (if (> a b)
      a
      b))

(maximum 1 2)


;; Combining tests with `or', `and', and `not'
(defun teenager (age)
  (if (and (> age 12) (< age 20))
      "Teenager"
      "Not teenager"))

(teenager 13)


;; Grouping procedures with `progn'
;; progn lets you do two things given some condition
;; for example:
;; (if (evenp a)
;;     (progn (print "Answer is even") 0)
;;     (progn (print "Answer is odd") 1))



;; Exercises

;; 1. Test whether a string is a palindrome
;; write a procedure `palendrome?' so that
;; (palindrome? "madam") = T
(defun palindrome? (str)
  (string= str (reverse str)))

(palindrome? "madam")
(palindrome? "racecar.") ;; not dealing with punctation yet


;; 2. Test whether an object is a list of two numbers
;; write a procedure `numberpair?' so that
;; (numberpair? '(45 67)) = T and
;; (numberpair? '("cat" "dog")) = nil
;; if parameter is a list of two numbers and nil otherwise
(defun numberpair? (lst)
  (and (numberp (nth 0 lst))
       (numberp (nth 1 lst))))

(numberpair? '(45 67))
(numberpair? '("cat" "dog"))
(numberpair? '(45 "dog"))


;; 3. Write a piglatin translator
;; improve the `piglatin' procedure to cope with
;; words begining with a vowel. Rule:
;;  if word begins with vowel you add "way" on the end
;; for example:
;; "pig" = "igpay"
;; but
;; "ant" = "antway"
;;
;; (defun piglatin (word)
;; (concatenate 'string (subseq word 1) (subseq word 0 1) "ay"))

(defun piglatin-robust (word)
  (let* ((fst-ltr (subseq word 0 1)))
    (if (or (string= fst-ltr "a")
            (string= fst-ltr "e")
            (string= fst-ltr "i")
            (string= fst-ltr "o")
            (string= fst-ltr "u"))
        (concatenate 'string word  "way")
        (concatenate 'string (subseq word 1) (subseq word 0 1) "ay"))))

(piglatin-robust "pig")
(piglatin-robust "ant")
