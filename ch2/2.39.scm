(load "../util/assert.scm")

(define nil '())


(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(assert-equal "(reverse '(1 4 9 16 25))" '(25 16 9 4 1) (reverse '(1 4 9 16 25)))


(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(assert-equal "(reverse '(1 4 9 16 25))" '(25 16 9 4 1) (reverse '(1 4 9 16 25)))
