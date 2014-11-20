(define nil '())

(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer
                      (list (square (car things)))))))
  (iter items nil))


(require "../util/assert")
(assert-equal "(square-list (list 1 2 3 4))" (list 1 4 9 16) (square-list (list 1 2 3 4)))
