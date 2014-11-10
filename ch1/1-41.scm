(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x) (+ x 1))


(require "../util/assert")
(assert-eqv "(((double (double double)) inc) 5)" 21 (((double (double double)) inc) 5))
