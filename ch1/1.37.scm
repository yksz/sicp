;; recursive process
(define (cont-frac n d k)
  (define (recur i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (recur (+ i 1))))))
  (recur 1))

;; iterative process
(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 0))

(define (f k)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             k))

(define golden-ratio (/ (+ 1 (sqrt 5)) 2))


(require "../util/assert")
(assert-approximate "(f 10)" (/ 1 golden-ratio) (f 10) 0.0001)
