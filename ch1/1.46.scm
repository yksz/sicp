(define (iterative-improve enough? improve)
  (define (recur guess)
    (if (enough? guess)
        guess
        (recur (improve guess)))))

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) 1.0))

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2.0))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance))
  ((iterative-improve close-enough? f) first-guess))


(require "../util/assert")
(assert-approximate "(sqrt 4)" 2.0 (sqrt 4) 0.001)
(assert-approximate "(fixed-point cos 1.0)" 0.7390822985224023 (fixed-point cos 1.0) 0.00001)
