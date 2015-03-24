(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (recur (+ i 1))))))
  (recur 1))

(define (e k)
  (+ (cont-frac (lambda (i) 1.0)
                (lambda (i)
                  (if (= (remainder (- i 2) 3) 0)
                      (* 2
                         (+ (/ (- i 2) 3)
                            1))
                      1))
                k)
     2))


(load "../util/assert.scm")
(assert-approximate "(e 10)" 2.71828 (e 10) 0.0001)
