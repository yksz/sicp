(define (same-parity first . rest)
  (let ((filter? (if (odd? first) odd? even?)))
    (define (iter src dst)
      (if (null? src)
          dst
          (if (filter? (car src))
              (iter (cdr src) (append dst (list (car src))))
              (iter (cdr src) dst))))
    (iter rest (list first))))


(load "../util/assert.scm")
(assert-equal "(same-parity 1 2 3 4 5 6 7)" (list 1 3 5 7) (same-parity 1 2 3 4 5 6 7))
(assert-equal "(same-parity 2 3 4 5 6 7)" (list 2 4 6) (same-parity 2 3 4 5 6 7))
