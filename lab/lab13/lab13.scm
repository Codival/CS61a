; Lab 13: Final Review

; Q2
(define (rle s)
 'YOUR-CODE-HERE
 (define (helper s count)
  (cond
   ((null? s) '())
   ((null? (cdr-stream s)) (cons-stream (list (car s) count) '()))
   ((= (car s) (car (cdr-stream s))) (helper (cdr-stream s) (+ 1 count)))
   (else (cons-stream (list (car s) count) (helper (cdr-stream s) 1)))
  )
 )
 (helper s 1)
)
; Q2 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q3
(define (tail-replicate x n)
  'YOUR-CODE-HERE
 (define (helper x n so-far)
  (cond ((= n 0) so-far) (else (helper x (- n 1) (cons x so-far)))
  )
 )
 (helper x n '())
)