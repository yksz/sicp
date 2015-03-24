(define (fast-* a b)
  (define (fast-*-iter a b c)
    (cond ((= b 0) c)
          ((even? b) (fast-*-iter (double a) (halve b) c))
          (else (fast-*-iter a (- b 1) (+ c a)))))
  (fast-*-iter a b 0))

(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))


(load "../util/assert.scm")
(assert-eqv "(fast-* 1 2)"  2 (fast-* 1 2))
(assert-eqv "(fast-* 3 4)" 12 (fast-* 3 4))
(assert-eqv "(fast-* 5 6)" 30 (fast-* 5 6))
(assert-eqv "(fast-* 7 8)" 56 (fast-* 7 8))
