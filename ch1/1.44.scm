(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x)
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3.0))))

(define (n-fold-smooth f n)
  (repeated smooth n) f)

(define (repeated f n)
  (if (= n 1)
    (lambda (x)
      (f x))
    (compose f (repeated f (- n 1)))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (inc x) (+ x 1))


(load "../util/assert.scm")
(assert-eqv "((smooth inc) 0)" 1.0 ((smooth inc) 0))
(assert-eqv "((n-fold-smooth inc 5) 0)" 1 ((n-fold-smooth inc 5) 0))
