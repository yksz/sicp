(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (square sub-tree)))
       tree))

(define (square x) (* x x))


(load "../util/assert.scm")
(define x '(1 (2 (3 4) 5) (6 7)))
(assert-equal "(square-tree x)" '(1 (4 (9 16) 25) (36 49)) (square-tree x))
