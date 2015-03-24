;; recursive process
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; iterative process
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (pi n)
  (define (square x) (* x x))
  (define (next x) (+ x 2))
  (define (term x)
    (/ (* x (next x))
       (square (+ x 1))))
  (* 4 (product term 2.0 next n)))


(load "../util/assert.scm")
(assert-approximate "(pi 1000)" 3.141592 (pi 1000) 0.01)
