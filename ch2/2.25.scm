(load "../util/assert.scm")

(define items1 '(1 3 (5 7) 9))
(assert-eqv "items1" 7 (car (cdr (car (cdr (cdr items1))))))

(define items2 '((7)))
(assert-eqv "items2" 7 (car (car items2)))

(define items3 '(1 (2 (3 (4 (5 (6 7)))))))
(assert-eqv "items3" 7 (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr items3)))))))))))))
