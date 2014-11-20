(define (deep-reverse items)
  (cond ((null? items) '())
        ((pair? (car items))
         (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))
        (else
          (append (deep-reverse (cdr items)) (list (car items))))))


(require "../util/assert")
(define x (list (list 1 2) (list 3 4)))
(assert-equal "x" '((1 2) (3 4)) x)
(assert-equal "(reverse x)" '((3 4) (1 2)) (reverse x))
(assert-equal "(deep-reverse x)" '((4 3) (2 1)) (deep-reverse x))
