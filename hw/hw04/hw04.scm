; Q1
(define (sign x)
  'YOUR-CODE-HERE
 (cond ((> x 0) 1) ((< x 0) -1) (else 0))
)

; Q2
(define (square x) (* x x))

(define (pow b n)
  'YOUR-CODE-HERE
 (cond ((zero? n) 1) ((even? n) (square (pow b (/ n 2)))) ((odd? n) (* b (square (pow b (/ (- n 1) 2))))))
)

; Q3
(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
 (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
 (car (cdr (cdr s)))
)

; Q4
(define (ordered? s)
  'YOUR-CODE-HERE
 (cond ((null? s) nil) ((null? (cdr s)) #t) ((> (car s) (cadr s)) #f) (else (ordered? (cdr s))))
)

; Q5
(define (nodots s)
  'YOUR-CODE-HERE
 (cond
  ((null? (cdr s)) s)
  ((and (pair? (car s)) (pair? (cdr s))) (cons (nodots (car s)) (nodots (cdr s))))
  ((pair? (car s)) (cons (nodots (car s)) (cons (cdr s) nil)))
  ((pair? (cdr s)) (cons (car s) (nodots (cdr s))))
  (else (cons (car s) (cons (cdr s) nil)))



 )
)

; Q6
(define (empty? s) (null? s))

(define (add s v)
 'YOUR-CODE-HERE
 (cond
  ((empty? s) (cons v nil))
  ((= (car s) v) s)
  ((> (car s) v) (cons v s))
  ((and (< (car s) v) (null? (cdr s))) (cons (car s) (cons v nil)))
  ((and (< (car s) v) (> (car (cdr s)) v)) (cons (car s) (cons v (cdr s))))
  (else (cons (car s) (add (cdr s) v))))
)

; Q7
; Sets as sorted lists
(define (contains? s v)
    'YOUR-CODE-HERE
 (cond
  ((= (car s) v) #t)
  ((null? (cdr s)) #f)
  (else (contains? (cdr s) v))
 )
    )

; Q8
(define (intersect s t)
    'YOUR-CODE-HERE
 (cond
  ((null? (cdr s))
   (if (contains? t (car s)) (cons (car s) nil) nil))
  ((contains? t (car s))
   (cons (car s) (intersect (cdr s) t)))
  (else
   (intersect (cdr s) t))
 )
    )

(define (union s t)
    'YOUR-CODE-HERE
 (cond
  ((null? (cdr s)) (add t (car s)))
  (else (union (cdr s) (add t (car s))))
 )
    )