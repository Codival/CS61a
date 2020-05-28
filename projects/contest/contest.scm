;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

(define (draw)
  ; YOUR CODE HERE
  (begin_fill)
  (bgcolor "gold")
  (define (fact n)
    (if (zero? n) 1 (* n (fact (- n 1))))
    )

(define (fib n)
    (define (helper n curr prev)
      (if (zero? n) prev
        (helper (- n 1) prev (+ curr prev))
        )

    )
    (helper n 0 1)
)


  (define (spiral sign n z)
    (if (= n z) (pendown)
        (begin
        (circle (sign (fib z)) 90) (speed 0) (spiral sign n (+ z 1))))
    )

 (define (lists x)
  (spiral + 5 0)
  (spiral - 5 0)
  (spiral + 5 0)
  )
 (define (loop x)
 (if (= x 0)
    (+ 1 3)
  (begin (lists 10)
  (loop (- x 1)))
 ))

 (define (maker x y)
 (if (= x y) (+ 3 4)
 (begin (loop 5)
 (penup)
 (left (fib 20))
 (forward (fib 10))
 (pendown)
 (loop 10)
 (maker (+ x 1) y))
 )
 )
 (maker 0 30)
 (penup)
 (right 50)
 (forward 80)
 (right 10)
 (pendown)
 (loop 10)
 (hideturtle)
; (define (draw) (define (helper n) (if (> n 0) (begin (begin_fill)
;   (pendown) (forward ((if (= (modulo n 2) 0) + *) 89 (remainder n 3))) (left (+ 89 (remainder n 7))) (end_fill) (backward (- 269 (remainder n 11))) (right ((if (= (modulo n 2) 0) - *) 270 (/ (remainder n 3) 3)))
;   (circle (remainder n 50)) (speed 3) (color (rgb (/ (remainder n 3) 3) (/ (remainder n 4) 4) (/ (remainder n 5) 5))) (bgcolor (rgb (/ (remainder n 3) 3) (/ (remainder n 4) 4) (/ (remainder n 5) 5))) (helper (- n 1))) 1)) (helper 250)

  (exitonclick))

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
