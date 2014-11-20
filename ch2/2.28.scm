(define (fringe tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))


(require "../util/assert")
(define x (list (list 1 2) (list 3 4)))
(assert-equal "(fringe x)" '(1 2 3 4) (fringe x))
(assert-equal "(fringe (list x x))" '(1 2 3 4 1 2 3 4) (fringe (list x x)))
