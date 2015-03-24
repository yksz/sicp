(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (recur (+ i 1))))))
  (recur 1))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (* -1 x x)))
             (lambda (i)
               (- (* 2 i) 1))
             k))

(define pi 3.14159)


(load "../util/assert.scm")
(assert-approximate "(tan-cf (/ pi 4) 10)" 1.0 (tan-cf (/ pi 4) 10) 0.0001)
