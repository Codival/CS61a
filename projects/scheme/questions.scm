(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
 (map (lambda (x) (append (list first) x)) rests)
)

(define (zip pairs)
 (define (helper pairs first second)
  (if (null? pairs) (list first second)
    (helper (cdr pairs) (append first (list (caar pairs))) (append second (list (car (cdar pairs)))))
  )
 )
 (helper pairs '() '())
)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
 (define (helper s index)
  (if (null? s) nil
   (cons (list index (car s)) (helper (cdr s) (+ index 1))))
 )
 (helper s 0)
  )
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  (define (helper total denoms path_so_far)
      (cond
          ((zero? total) (list path_so_far))
          ((or (< total 0) (zero? (length denoms))) '())
          (else
              (append (helper (- total (car denoms)) denoms (append path_so_far (list (car denoms)) ))
              (helper total (cdr denoms) path_so_far))
          )
      )
    )
 (helper total denoms '())
 )
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
          (append (list form params) (map let-to-lambda body))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
          (define zipper (zip values))
          (cons (list 'lambda (car zipper) (let-to-lambda (car body))) (map let-to-lambda (cadr zipper)))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
         (map let-to-lambda expr)
         ; END PROBLEM 19
         )))
