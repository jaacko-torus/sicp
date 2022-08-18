#lang sicp

(define pi 3.14159)
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (abs x)
  (if (< x 0) (- x) x))
(define (max a b) (if (> a b) a b))
(define (min a b) (if (< a b) a b))
