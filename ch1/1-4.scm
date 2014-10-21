(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


(require "../util/assert")
(assert (= 2 (a-plus-abs-b 1 +1)) "(a-plus-abs-b 1 +1)")
(assert (= 2 (a-plus-abs-b 1 -1)) "(a-plus-abs-b 1 -1)")
