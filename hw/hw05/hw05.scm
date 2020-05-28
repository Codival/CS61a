;;;;;;;;;;;;;;;
;; Questions ;;
;;;;;;;;;;;;;;;

; Mutable functions in Scheme

(define (make-fib)
  (define curr 0) (define next 1)
  'YOUR-CODE-HERE
 (define holder 0) (define prev 0)
 (define (fib!)
  (set! prev curr)
  (set! holder next)
  (set! next (+ curr next))
  (set! curr holder)
  prev
 )
fib!)