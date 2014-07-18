; Exercise 43 - 45
#lang htdp/bsl
(require test-engine/racket-tests)
(require 2htdp/universe)
(require 2htdp/image)

(define SCENE-WIDTH 400)
(define SCENE-HEIGHT 400)
(define BG (empty-scene SCENE-WIDTH SCENE-HEIGHT))
(define CAT1 (bitmap "cat1.png"))
(define CAT2 (bitmap "cat2.png"))
(define CAT-SPEED 3)
(define CAT-Y (/ SCENE-HEIGHT 2))
(define CAT-WIDTH (image-width CAT1))
(define CAT-RADIUS (floor (/ CAT-WIDTH 2)))


; WorldState is a Number
; interpret: cat's horizontal position on screen


; WorldState -> WorldState
(define (main ws)
  (big-bang ws
            [to-draw show-cat]
            [on-tick update-cat-pos 0.1]))


; WorldState -> Image
; Place the cat on the canvas at its position
(check-expect (show-cat 50)
              (place-image CAT1
                           50 CAT-Y
                           BG))
(check-expect (show-cat 51)
              (place-image CAT2
                           51 CAT-Y
                           BG))
(define (show-cat ws)
  (place-image (if (odd? ws) CAT2
                             CAT1)
               ws CAT-Y
               BG))


; WorldState -> WorldState
; Update cat's position on screen
(check-expect (update-cat-pos 50)
              (+ 50 CAT-SPEED))
(check-expect (update-cat-pos SCENE-WIDTH)
              (+ SCENE-WIDTH CAT-SPEED))
(check-expect (update-cat-pos (+ SCENE-WIDTH CAT-RADIUS))
              (- CAT-SPEED CAT-RADIUS))
(define (update-cat-pos ws)
 (- (modulo (+ ws CAT-SPEED CAT-RADIUS)
            (+ SCENE-WIDTH (* CAT-RADIUS 2)))
    CAT-RADIUS))



(test)
(main (/ SCENE-WIDTH 2))
