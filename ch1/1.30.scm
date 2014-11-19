(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))


(require "../util/assert")
(assert-eqv "(sum cube 0 next 3)" 36 (sum cube 0 inc 3))
