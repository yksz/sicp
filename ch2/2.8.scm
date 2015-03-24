(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))


(load "../util/assert.scm")
(define x (make-interval 8 4))
(define y (make-interval 2 0))
(assert-eqv "(upper-bound (sub-interval x y))" 8 (upper-bound (sub-interval x y)))
(assert-eqv "(lower-bound (sub-interval x y))" 2 (lower-bound (sub-interval x y)))
