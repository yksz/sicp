(define (assert expr msg)
  (if (not expr)
      (print (string-append "Assertion Failed: " msg))))

(define (assert-approximate expected expr error msg)
  (assert (and (>= expr (- expected error))
               (<= expr (+ expected error)))
          msg))
