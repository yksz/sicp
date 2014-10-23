(define (assert expr msg)
  (if (not expr)
      (error "assert:" msg)))

(define (assert-eqv msg expected actual)
  (if (not (eqv? expected actual))
      (error "assert:" msg "expected" expected "actual" actual)))

(define (assert-equal msg expected actual)
  (if (not (equal? expected actual))
      (error "assert:" msg "expected" expected "actual" actual)))

(define (assert-approximate msg expected actual delta)
  (if (not (and (>= actual (- expected delta))
                (<= actual (+ expected delta))))
      (error "assert:" msg "expected" expected "actual" actual)))
