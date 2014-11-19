(define (fast-* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-* a (halve b))))
        (else (+ a (fast-* a (- b 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))


(require "../util/assert")
(assert-eqv "(fast-* 1 2)"  2 (fast-* 1 2))
(assert-eqv "(fast-* 3 4)" 12 (fast-* 3 4))
(assert-eqv "(fast-* 5 6)" 30 (fast-* 5 6))
(assert-eqv "(fast-* 7 8)" 56 (fast-* 7 8))
