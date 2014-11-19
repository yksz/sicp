(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (average x y)
  (/ (+ x y) 2.0))

(define (repeated f n)
  (if (= n 1)
    (lambda (x)
      (f x))
    (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (root x n)
  (let ((count (floor (+ (log n 2) 0.5))))
    (fixed-point ((repeated average-damp count) (lambda (y)
                                                  (/ x (expt y (- n 1)))))
                 1.0)))


(require "../util/assert")
(assert-approximate "(root    4  2)" 2.0 (root    4  2) 0.00001)
(assert-approximate "(root    8  3)" 2.0 (root    8  3) 0.00001)
(assert-approximate "(root   16  4)" 2.0 (root   16  4) 0.00001)
(assert-approximate "(root   32  5)" 2.0 (root   32  5) 0.00001)
(assert-approximate "(root   64  6)" 2.0 (root   64  6) 0.00001)
(assert-approximate "(root  128  7)" 2.0 (root  128  7) 0.00001)
(assert-approximate "(root  256  8)" 2.0 (root  256  8) 0.00001)
(assert-approximate "(root  512  9)" 2.0 (root  512  9) 0.00001)
(assert-approximate "(root 1024 10)" 2.0 (root 1024 10) 0.00001)
