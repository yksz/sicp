(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter? a) (term a) null-value)
                (filtered-accumulate filter? combiner null-value term (next a) next b))))

(define (sum-of-square-of-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (prime? n)
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (divides? a b)
    (= (remainder b a) 0))
  (= n (smallest-divisor n)))

(define (product-relatively-prime n)
  (define (filter? i)
    (= (gcd i n) 1))
  (filtered-accumulate filter? * 1 identity 1 inc n))

(define (square x) (* x x))
(define (identity x) x)
(define (inc x) (+ x 1))


(require "../util/assert")
(assert-eqv "(sum-of-square-of-prime 2 10)"  87 (sum-of-square-of-prime 2 10))
(assert-eqv "(product-relatively-prime 10)" 189 (product-relatively-prime 10))
