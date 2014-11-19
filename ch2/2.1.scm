(define (make-rat n d)
  (cond ((< d 0) (cons (* -1 n) (* -1 d)))
        (else (cons n d))))

(define (numer x) (car x))
(define (denom x) (cdr x))


(require "../util/assert")
(assert-eqv "(numer (make-rat  1  2))"  1 (numer (make-rat  1  2)))
(assert-eqv "(denom (make-rat  1  2))"  2 (denom (make-rat  1  2)))
(assert-eqv "(numer (make-rat -1  2))" -1 (numer (make-rat -1  2)))
(assert-eqv "(denom (make-rat -1  2))"  2 (denom (make-rat -1  2)))
(assert-eqv "(numer (make-rat  1 -2))" -1 (numer (make-rat  1 -2)))
(assert-eqv "(denom (make-rat  1 -2))"  2 (denom (make-rat  1 -2)))
(assert-eqv "(numer (make-rat -1 -2))"  1 (numer (make-rat -1 -2)))
(assert-eqv "(denom (make-rat -1 -2))"  2 (denom (make-rat -1 -2)))
