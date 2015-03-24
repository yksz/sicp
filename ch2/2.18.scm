(define (reverse items)
  (if (null? (car items))
      items
      (append (reverse (cdr items)) (list (car items)))))


(load "../util/assert.scm")
(assert-equal "(reverse (list 1 4 9 16 25))" (list 25 16 9 4 1) (reverse (list 1 4 9 16 25)))
