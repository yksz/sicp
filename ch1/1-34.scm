(define (f g)
  (g 2))

(f f) ; => error: (2, 2)
