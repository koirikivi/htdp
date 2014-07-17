#lang htdp/bsl
; (require htdp/testing)
(require test-engine/racket-tests)

; String -> String
; extract the first character from string s
; given "foo", expect "f"
; given "b", expect "b"
(define (string-first s) (string-ith s 0))
;  Tests:
;(string-first "foo")
;(string-first "b")

; String -> String
; extract the last character from string s
(check-expect (string-last "foo") "o")
(check-expect (string-last "b") "a")
(define (string-last s)
 (string-ith s (- (string-length s) 1)))

(test)
