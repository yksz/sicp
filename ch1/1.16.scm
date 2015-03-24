(define (fast-expt b n)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (square b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* a b)))))
  (fast-expt-iter b n 1))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))


(load "../util/assert.scm")
(assert-eqv "(fast-expt 2 1)"     2 (fast-expt 2 1))
(assert-eqv "(fast-expt 2 2)"     4 (fast-expt 2 2))
(assert-eqv "(fast-expt 2 4)"    16 (fast-expt 2 4))
(assert-eqv "(fast-expt 2 6)"    64 (fast-expt 2 6))
(assert-eqv "(fast-expt 2 8)"   256 (fast-expt 2 8))
(assert-eqv "(fast-expt 2 10)" 1024 (fast-expt 2 10))
