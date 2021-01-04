;; Printing

;; Printing a result with `print'
;; `print' first presnts the "effect of the procedure"
;; then prints the value returned by the procedure
(defun print-and-double (n)
  (print n)
  (* n 2))

(print-and-double 12)


;; Printing formatte values with `format'
;; takes two or more parameters:
;;
;; first parameter is either:
;;  t (print result) or
;;  nil (return result as string)
;;
;; second parameter is a "format string"
;; a format value prefixed by ~
(format t "The answer is ~a." (* 2 3))
;; or
(format nil "The answer is ~a." (* 2 3))


;; Exercises

;; 1. use `format' to write a story-writing program.
;; write a procedure `story' that takes:
;;   - name
;;   - food
;;   - color
;; for example, (story "Lisa" "cheese" "green") =
;; "There once was a princess called Lisa who liked cheese. One day Lisa
;; found some green chees and ate so much that she died. The end"
(defun story (name food color)
  (let* ((beginning (format nil "There once was a person named ~a.~%" name))
         (middle (format nil "One day ~a found some ~a ~a and ate so much that they died.~%" name color food))
         (end (format nil "The end."))
         (result (concatenate 'string beginning middle end)))
    result))

(story "Jack" "tuna" "yellow")
