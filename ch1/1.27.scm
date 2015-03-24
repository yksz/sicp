(use srfi-27)

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x)
  (* x x))


(load "../util/assert.scm")
(assert-eqv "(fermat-test 561)"  #t (fermat-test 561))
(assert-eqv "(fermat-test 1105)" #t (fermat-test 1105))
(assert-eqv "(fermat-test 1729)" #t (fermat-test 1729))
(assert-eqv "(fermat-test 2465)" #t (fermat-test 2465))
(assert-eqv "(fermat-test 2821)" #t (fermat-test 2821))
(assert-eqv "(fermat-test 6601)" #t (fermat-test 6601))
