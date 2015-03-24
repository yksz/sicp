(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v))
       m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row))
         m)))

(define nil '())

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


(load "../util/assert.scm")
(define v '(1 2 3))
(define w '(4 5 6))
(define m '((1 2 3) (4 5 6) (7 8 9)))
(assert-eqv "(dot-product v w)" 32 (dot-product v w))
(assert-equal "(matrix-*-vector m v)" '(14 32 50) (matrix-*-vector m v))
(assert-equal "(transpose m)" '((1 4 7) (2 5 8) (3 6 9)) (transpose m))
(assert-equal "(matrix-*-matrix m n)" '((30 36 42) (66 81 96) (102 126 150)) (matrix-*-matrix m m))
