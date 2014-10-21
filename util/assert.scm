(define (assert expr msg)
  (if (not expr)
      (print (string-append "Assertion Failed: " msg))))
