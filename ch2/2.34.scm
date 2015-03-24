(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* higher-terms x)))
              0
              coefficient-sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(load "../util/assert.scm")
;; 1 + 3x + 5x^3 + x^5 at x = 2
(assert-eqv "(horner-eval 2 (list 1 3 0 5 0 1)" 79 (horner-eval 2 (list 1 3 0 5 0 1)))
