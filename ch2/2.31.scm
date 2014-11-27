(define (square-tree tree) (tree-map square tree))

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define (square x) (* x x))


(require "../util/assert")
(define x '(1 (2 (3 4) 5) (6 7)))
(assert-equal "(square-tree x)" '(1 (4 (9 16) 25) (36 49)) (square-tree x))
