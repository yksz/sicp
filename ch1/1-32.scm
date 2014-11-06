;; recursive process
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

;; iterative process
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))


(require "../util/assert")
(assert-eqv "(sum cube 0 next 3)"      36 (sum cube 0 inc 3))
(assert-eqv "(product cube 1 next 3)" 216 (product cube 1 inc 3))
