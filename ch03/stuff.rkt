#lang htdp/bsl
(require test-engine/racket-tests)

; String -> String
; extract the first character from string s
(check-expect (string-first "foo") "f")
(check-expect (string-first "b") "b")
(define (string-first s) (string-ith s 0))

; String -> String
; extract the last character from string s
(check-expect (string-last "foo") "o")
(check-expect (string-last "b") "b")
(define (string-last s)
 (string-ith s (- (string-length s) 1)))

; Running unit tests:
;(require test-engine/racket-tests)
;(test)


;; UI STUFF
(require 2htdp/universe)
(require 2htdp/image)
(define SCENE-WIDTH 400)
(define SCENE-HEIGHT 400)
(define BG (empty-scene SCENE-WIDTH SCENE-HEIGHT))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ROCKET PROGRAM
;(define ROCKET (overlay/xy (triangle 40 "solid" "blue")
;                           0 (sqrt (- (sqr 40) (sqr (/ 40 2))))
;                           (rectangle 40 80 "solid" "green")))
(define ROCKET (bitmap "rocket-s.jpg"))

(define (rocket-program start)
  (big-bang start
            [to-draw create-rocket-scene]))

; WorldState -> Image
; Place the rocket on a scene at height y
(check-expect (create-rocket-scene 100)
              (place-image ROCKET
                           (/ SCENE-WIDTH 2) 100
                           BG))
(define (create-rocket-scene y)
  (place-image ROCKET
               (/ SCENE-WIDTH 2) y
               BG))
; WorldState -> WorldState
; TODO

;; /ROCKET PROGRAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(test)
;(cat-program)
