(define (cbrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess x)
      guess
      (cbrt-iter (improve guess x)
                 guess
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess prev-guess x)
  (< (abs (- guess prev-guess)) 0.001))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (cbrt x)
  (cbrt-iter 1.0 0.0 x))


(require "../util/assert")
(assert-approximate "(cbrt 0.001)" 0.1 (cbrt 0.001) 0.001)
