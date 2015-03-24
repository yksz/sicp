(define (repeated f n)
  (if (= n 1)
    (lambda (x)
      (f x))
    (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square x) (* x x))


(load "../util/assert.scm")
(assert-eqv "((repeated square 2) 5)" 625 ((repeated square 2) 5))
