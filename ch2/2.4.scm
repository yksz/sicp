(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))


(require "../util/assert")
(assert-eqv "(car (cons 1 2))" 1 (car (cons 1 2)))
(assert-eqv "(cdr (cons 1 2))" 2 (cdr (cons 1 2)))
