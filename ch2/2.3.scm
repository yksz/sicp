(require "../util/assert")

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (perimeter rect)
  (let ((w (width rect))
        (h (height rect)))
    (+ (* 2 w) (* 2 h))))

(define (area rect)
  (let ((w (width rect))
        (h (height rect)))
    (* w h)))

(define (make-rectanble point width height)
  (cons point (cons width height)))
(define (width rect) (car (cdr rect)))
(define (height rect) (cdr (cdr rect)))

(define rect1 (make-rectanble (make-point 1 2) 3 4))
(assert-eqv "(perimeter rect1)" 14 (perimeter rect1))
(assert-eqv "(area rect1)" 12 (area rect1))


(define (make-rectanble p1 p2) (cons p1 p2))
(define (width rect)
  (let ((p1 (car rect))
        (p2 (cdr rect)))
  (- (x-point p2) (x-point p1))))
(define (height rect)
  (let ((p1 (car rect))
        (p2 (cdr rect)))
  (- (y-point p2) (y-point p1))))

(define rect2 (make-rectanble (make-point 1 2) (make-point 3 4)))
(assert-eqv "(perimeter rect2)" 8 (perimeter rect2))
(assert-eqv "(area rect2)" 4 (area rect2))
