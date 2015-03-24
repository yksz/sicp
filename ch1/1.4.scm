(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


(load "../util/assert.scm")
(assert-eqv "(a-plus-abs-b 1 +1)" 2 (a-plus-abs-b 1 +1))
(assert-eqv "(a-plus-abs-b 1 -1)" 2 (a-plus-abs-b 1 -1))
