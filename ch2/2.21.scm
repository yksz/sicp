(require "../util/assert")

(define nil ())

(define (square x) (* x x))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))
(assert-equal "(square-list (list 1 2 3 4))" (list 1 4 9 16) (square-list (list 1 2 3 4)))

(define (square-list items)
  (map square items))
(assert-equal "(square-list (list 1 2 3 4))" (list 1 4 9 16) (square-list (list 1 2 3 4)))
