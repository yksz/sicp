(define nil '())

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(load "../util/assert.scm")
(define seq1 '(1 2 3))
(define seq2 '(4 5 6))
(define (square x) (* x x))
(assert-equal "(map square seq1)" '(1 4 9) (map square seq1))
(assert-equal "(append seq1 seq2)" '(1 2 3 4 5 6) (append seq1 seq2))
(assert-eqv "(length seq1)" 3 (length seq1))
