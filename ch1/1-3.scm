(define (f x y z)
  (sum-of-square (max x y)
                 (max (min x y) z)))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x))


(require "../util/assert")
(assert-eqv "(f 1 2 3)" 13 (f 1 2 3))
(assert-eqv "(f 1 3 2)" 13 (f 1 3 2))
(assert-eqv "(f 2 1 3)" 13 (f 2 1 3))
(assert-eqv "(f 2 3 1)" 13 (f 2 3 1))
(assert-eqv "(f 3 1 2)" 13 (f 3 1 2))
(assert-eqv "(f 3 2 1)" 13 (f 3 2 1))
