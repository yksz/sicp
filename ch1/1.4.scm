(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


(require "../util/assert")
(assert-eqv "(a-plus-abs-b 1 +1)" 2 (a-plus-abs-b 1 +1))
(assert-eqv "(a-plus-abs-b 1 -1)" 2 (a-plus-abs-b 1 -1))
