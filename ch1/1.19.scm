(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))   ; compute p'
                   (+ (* 2 p q) (* q q)) ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


(require "../util/assert")
(assert-eqv "(fib 1)"  1 (fib 1))
(assert-eqv "(fib 2)"  1 (fib 2))
(assert-eqv "(fib 3)"  2 (fib 3))
(assert-eqv "(fib 4)"  3 (fib 4))
(assert-eqv "(fib 5)"  5 (fib 5))
(assert-eqv "(fib 6)"  8 (fib 6))
(assert-eqv "(fib 7)" 13 (fib 7))
(assert-eqv "(fib 8)" 21 (fib 8))
(assert-eqv "(fib 9)" 34 (fib 9))
