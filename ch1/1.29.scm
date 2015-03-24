(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (cond ((= k 0) (y k))
          ((= k n) (y k))
          ((odd? k) (* 4 (y k)))
          (else (* 2 (y k)))))
  (define (next x)
    (+ x 1))
  (* (/ h 3) (sum term 0.0 next n)))

(define (cube x)
  (* x x x))


(load "../util/assert.scm")
(assert-approximate "(integral cube 0 1 0.01)" 0.25 (integral cube 0 1 0.01) 0.01)
(assert-approximate "(simpson cube 0 1 100)"   0.25 (simpson cube 0 1 100)   0.001)
(assert-approximate "(simpson cube 0 1 1000)"  0.25 (simpson cube 0 1 1000)  0.001)
