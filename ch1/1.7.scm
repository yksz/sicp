(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess x)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess prev-guess x)
  (< (abs (- guess prev-guess)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))


(require "../util/assert")
(assert-approximate "(sqrt 0.0001)" 0.01 (sqrt 0.0001) 0.001)
