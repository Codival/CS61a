;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Streams

(define (find s predicate)
  'YOUR-CODE-HERE
 (if (null? s) #f (if (predicate (car s)) (car s) (find (cdr-stream s) predicate)))

)

(define (scale-stream s k)
  'YOUR-CODE-HERE
 (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k))
)

(define (has-cycle? s)
  (define (pair-tracker seen-so-far curr)
    (cond ((null? curr) #f)
          ((contains? seen-so-far curr) #t)
          (else (pair-tracker (cons curr seen-so-far) (cdr-stream curr))))
    )
 (pair-tracker '() (cdr-stream s))
)

(define (contains? lst s)
  'YOUR-CODE-HERE
 (if (null? lst) #f (if (eq? (car lst) s) #t (contains? (cdr lst) s)))
)
(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)

; Tail recursion

(define (accumulate combiner start n term)
 'YOUR-CODE-HERE
 (define (helper combiner start n term total)
  (if (> start n) total (helper combiner (+ 1 start) n term (combiner total (term start)))
  )
 )
 (helper combiner 1 n term start)
)

; Macros

(define-macro (list-of expr for var in lst if filter-expr)
  'YOUR-CODE-HERE
 `(map (lambda (,var) ,expr) (filter (lambda (,var) ,filter-expr),lst))
)