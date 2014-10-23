(define (fn x y z)
  (sum-of-square (max x y)
                 (max (min x y) z)))

(define (sum-of-square x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x))


(require "../util/assert")
(assert-eqv "(fn 1 2 3)" 13 (fn 1 2 3))
(assert-eqv "(fn 1 3 2)" 13 (fn 1 3 2))
(assert-eqv "(fn 2 1 3)" 13 (fn 2 1 3))
(assert-eqv "(fn 2 3 1)" 13 (fn 2 3 1))
(assert-eqv "(fn 3 1 2)" 13 (fn 3 1 2))
(assert-eqv "(fn 3 2 1)" 13 (fn 3 2 1))
