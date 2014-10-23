(require "../util/assert")

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(assert-eqv "(A 1 10)" 1024 (A 1 10))
(assert-eqv "(A 2 4)" 65536 (A 2 4))
(assert-eqv "(A 3 3)" 65536 (A 3 3))

(define (f n) (A 0 n)) ; 2n
(assert-eqv "(f 0)" 0 (f 0))
(assert-eqv "(f 1)" 2 (f 1))
(assert-eqv "(f 2)" 4 (f 2))
(assert-eqv "(f 3)" 6 (f 3))

(define (g n) (A 1 n)) ; 2^n (n>0)
(assert-eqv "(g 0)" 0 (g 0))
(assert-eqv "(g 1)" 2 (g 1))
(assert-eqv "(g 2)" 4 (g 2))
(assert-eqv "(g 3)" 8 (g 3))

(define (h n) (A 2 n)) ; 2^(h(n-1)) (n>1)
(assert-eqv "(h 0)" 0 (h 0))
(assert-eqv "(h 1)" 2 (h 1))
(assert-eqv "(h 2)" 4 (h 2))
(assert-eqv "(h 3)" 16 (h 3))
