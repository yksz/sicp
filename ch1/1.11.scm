(require "../util/assert")

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))
(assert-eqv "(f 1)"  1 (f 1))
(assert-eqv "(f 2)"  2 (f 2))
(assert-eqv "(f 3)"  4 (f 3))
(assert-eqv "(f 4)" 11 (f 4))
(assert-eqv "(f 5)" 25 (f 5))

(define (f n)
  (define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (- count 1))))
  (f-iter 2 1 0 n))
(assert-eqv "(f 1)"  1 (f 1))
(assert-eqv "(f 2)"  2 (f 2))
(assert-eqv "(f 3)"  4 (f 3))
(assert-eqv "(f 4)" 11 (f 4))
(assert-eqv "(f 5)" 25 (f 5))
