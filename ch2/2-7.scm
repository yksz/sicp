(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))


(require "../util/assert")
(assert-eqv "(upper-bound (make-interval 1 2))" 2 (upper-bound (make-interval 1 2)))
(assert-eqv "(upper-bound (make-interval 2 1))" 2 (upper-bound (make-interval 2 1)))
(assert-eqv "(lower-bound (make-interval 1 2))" 1 (lower-bound (make-interval 1 2)))
(assert-eqv "(lower-bound (make-interval 2 1))" 1 (lower-bound (make-interval 2 1)))
