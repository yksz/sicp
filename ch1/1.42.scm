(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))


(load "../util/assert.scm")
(assert-eqv "((compose square inc) 6)" 49 ((compose square inc) 6))
