(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))


(load "../util/assert.scm")
(assert-equal "(last-pair (list 23 72 149 34))" (list 34) (last-pair (list 23 72 149 34)))
