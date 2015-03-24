(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (sub-t)
                     (if (pair? sub-t)
                         (count-leaves sub-t)
                         1))
                   t)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(load "../util/assert.scm")
(define x (cons (list 1 2) (list 3 4)))
(assert-eqv "(count-leaves x)" 4 (count-leaves x))
(assert-eqv "(count-leaves (list x x))" 8 (count-leaves (list x x)))
