(define zero (lambda (f) (lambda (x) x)))
(define one  (lambda (f) (lambda (x) (f x))))
(define two  (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc x) (+ x 1))

(define (church->integer n)
  ((n inc) 0))

(define (+ m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))


(load "../util/assert.scm")
(assert-eqv "(church->integer zero)" 0 (church->integer zero))
(assert-eqv "(church->integer one)"  1 (church->integer one))
(assert-eqv "(church->integer two)"  2 (church->integer two))
(assert-eqv "(church->integer (+ one two))" 3 (church->integer (+ one two)))
