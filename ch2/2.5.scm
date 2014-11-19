(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car z)
  (define (car-iter n count)
    (if (not (= (remainder n 2) 0))
        count
        (car-iter (/ n 2) (+ count 1))))
  (car-iter z 0))

(define (cdr z)
  (define (cdr-iter n count)
    (if (not (= (remainder n 3) 0))
        count
        (cdr-iter (/ n 3) (+ count 1))))
  (cdr-iter z 0))


(require "../util/assert")
(assert-eqv "(car (cons 1 2))" 1 (car (cons 1 2)))
(assert-eqv "(cdr (cons 1 2))" 2 (cdr (cons 1 2)))
(assert-eqv "(car 108)" 2 (car 108))
(assert-eqv "(cdr 108)" 3 (cdr 108))
