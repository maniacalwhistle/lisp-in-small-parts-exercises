;; Project: Animals

;; Pre-amble

;; need to test out ways to prompt
;; without the capi package
;; (defun areaofcircle()
;;    (terpri)
;;    (princ "Enter Radius: ")
;;    (setq radius (read))
;;    (setq area (* 3.1416 radius radius))
;;    (format t "Radius: = ~F~% Area = ~F" radius area)
;; )
;; (areaofcircle)

;; another way
(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

;; (defun prompt-for-cd ()
;;   (list (prompt-read "Title")
;;         (prompt-read "Artist")
;;         (or (parse-integer (prompt-read "Rating") :junk-allowed t) 0)
;;         (y-or-n-p "Ripped [y/n]: ")))


;; Learning an animal

;; this is how the author writes this with the package capi
;; (defun learn-animal (animal new-animal)
;;   (let ((question
;;          (capi:prompt-for-string
;;           (format nil "Give me a yes/no question to distinguish between ~a and ~a"
;;                   new-animal animal))))
;;     (if (capi:prompt-for-confirmation
;;          (format nil "What would the answer be for ~a?" new-animal))
;;         (list question animal new-animal))
;;     (list question new-animal animal)))

;; use the `prompt-read' function to mimic a dialog box
(defun learn-animal (animal new-animal)
  (let ((question
         (prompt-read
          (format nil "Give me a yes/no question to distinguish between ~a and ~a"
                  new-animal animal))))
    (if (y-or-n-p (format nil "What would the answer be for ~a?" new-animal))
        (list question animal new-animal))
    (list question new-animal animal)))


;; Making a guess

;; write a procedure `make-guess'
;; when we've reached an animal on the tree
;; pass that animal as parameter and guess it as the answer
;;  - return animal if correct
;;  - otherwise, call `learn-animal'
(defun make-guess (animal)
  (if (y-or-n-p (format nil "Is it ~a?" animal))
      (let ((message (print "Ho ho!")))
        animal)
      (learn-animal animal (prompt-read "What were you thinking of?"))))


;; Asking a question
;; write a procedure `ask-question' that
;; is called when we are at a question on a tree.
;; It asks a question and calls `animals':
;;  - on left branch if yes
;;  - on right branch if no
(defun ask-question (tree)
  (if (y-or-n-p (first tree))
      (list (first tree) (animals (second tree)) (third tree))
      (list (first tree) (second tree) (animals (third tree)))))


;; The main procedure - `animals'
;; called with current position on tree as a parameter
;; and calls `ask-question' if parameter is a list (aka more questions need to be asked)
;; or calls `make-guess' if parameter is an animal indicating we are at bottom of branch
(defun animals (tree)
  (if (listp tree)
      (ask-question tree)
      (make-guess tree)))

;; then save the modified tree back as `*tree*'
;; with a routine `play-animals'

(defparameter animals-tree '("Does it live in the sea?" "a dolphin" "a horse"))

(defun play-animals ()
  (setf animals-tree (animals animals-tree)))
