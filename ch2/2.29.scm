(require "../util/assert")
(define (test-mobile)
  (define b1 (make-branch 2 1))
  (define m1 (make-mobile b1 b1))
  (define b2 (make-branch 1 m1))
  (define m2 (make-mobile b1 b2))
  (define b3 (make-branch 1 m2))
  (define m3 (make-mobile b1 b3))
  (assert-eqv "(total-weight m1)" 2 (total-weight m1))
  (assert-eqv "(total-weight m2)" 3 (total-weight m2))
  (assert-eqv "(total-weight m3)" 4 (total-weight m3))
  (assert "(total-balanced? m1)" (total-balanced? m1))
  (assert "(total-balanced? m2)" (total-balanced? m2))
  (assert "(not (total-balanced? m3))" (not (total-balanced? m3))))


(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (define (mobile-weight m)
    (+ (branch-weight (left-branch m))
       (branch-weight (right-branch m))))
  (define (branch-weight b)
    (if (not (pair? (branch-structure b)))
        (branch-structure b)
        (mobile-weight (branch-structure b))))
  (mobile-weight mobile))

(define (total-balanced? mobile)
  (define (mobile-balanced? m)
    (= (branch-moment (left-branch m))
       (branch-moment (right-branch m))))
  (define (branch-moment b)
    (if (not (pair? (branch-structure b)))
        (* (branch-length b) (branch-structure b))
        (* (branch-length b) (total-weight (branch-structure b)))))
  (mobile-balanced? mobile))

(test-mobile)


(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))

(test-mobile)
