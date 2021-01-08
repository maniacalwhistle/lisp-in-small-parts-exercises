;; Anagrams

;; read word list dictionary as variable `wordlist'
(defparameter wordlist
  (with-open-file (stream "words.lisp")
    (read stream)))

(print (first wordlist))

;; use a "hash table" object to store data indexed by 'key'
;; hash table keys will be strings in an object `dict'
(defparameter dict
  (make-hash-table :test #'equal))

(gethash "cat" dict)

;; change hash-table entry for "cat"
(setf (gethash "cat" dict) "maiou")
(gethash "cat" dict)


;; How anagram program works
;; write a procedure `sort-word' that first
;; sorts each words so letters are alphabetical
(defun sort-word (word)
  (sort (copy-seq word) 'char<))

(sort-word "orchestra")
(sort-word "carthorse")

;; store all words from our list into hash table
;; using sorted version of word as key so that
;; (gethash "acehorrst" dict) returns ("orchestra" "carthorse")
(defun add-word (word)
  (let* ((sword (sort-word word)))
    (setf (gethash sword dict) (cons word (gethash sword dict)))))

;; call `add-word' to add words to our hash-table dictionary
(defun add-words-to-dict (word-list)
  (if (null word-list)
      nil
      (let ((word (first word-list)))
        (add-word word)
        (add-words-to-dict (rest word-list)))))

;; run it on our word list stored in variable `wordlist'
(add-words-to-dict wordlist)


;; Using the anagram-solving tool
(defun find-anagram (word)
  (gethash (sort-word word) dict))

(find-anagram "orchestra")

;; make it interactive
(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun anagram ()
  (find-anagram (prompt-read "Find anagram:")))
