(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x) (+ x 1))


(load "../util/assert.scm")
(assert-eqv "(((double (double double)) inc) 5)" 21 (((double (double double)) inc) 5))
