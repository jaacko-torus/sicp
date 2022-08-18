#lang sicp

(define pi 3.14159)
(define (square x) (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (abs0 x)
  (cond ((< x 0) (- x))
        (else x)))
(define (abs1 x)
  (if (< x 0)
      (- x)
      x))

;;; exercises
"|--> 1.1 <--|"
;;; Below is a sequence of expressions. What is the result printed by the interpreter in response to
;;; each expression? Assume that the sequence is to be evaluated in the order in which it is
;;; presented.
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

"|--> 1.2 <--|"
;;; Translate the following expression into prefix form: $\frac{5 + 4 + \left(2 - \left(3 - \left(6 + 
;;; \frac{4}{5}\right)\right)\right)}{3\left(6 - 2\right)\left(2 - 7\right)}$.
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))))
   (* 3 (- 6 2) (- 2 7))

"|--> 1.3 <--|"
;;; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the
;;; two larger numbers.
(define (max a b) (if (> a b) a b))
(define (min a b) (if (< a b) a b))
(define (max-of-3 a b c) (max (max a b) c))
(define (min-of-3 a b c) (min (min a b) c))
(define (mid-of-3 a b c) (- (+ a b c) (max-of-3 a b c) (min-of-3 a b c)))
(define (e1.3 a b c)
  (sum-of-squares (max-of-3 a b c) (mid-of-3 a b c)))
"e1.3"
;;; I found this answer here (https://stackoverflow.com/a/1518167/14238358) and I found it very
;;; elegant.
(define (e1.3-alt a b c)
  (+ (square (max a b)
     (square (max (min a b) c)))))

"|--> 1.4 <--|"
;;; Observe that our model of evaluation allows for combinations whose operators are compound
;;; expressions. Use this observation to describe the behavior of the following procedure:
;;; ```lisp
;;; (define (a-plus-abs-b a b)
;;;   ((if (> b 0) + -) a b))
;;; ```
"`+` and `-` are functions"

"|--> 1.5 <--|"
;;; Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using
;;; applicative order evaluation or normal-order evaluation. He defines the following two procedures:
;;; ```lisp
;;; (define (p) (p))
;;; (define (test x y)
;;;   (if (= x 0) 0 y))
;;; ```
;;; Ten he evaluates the expression
;;; ```lisp
;;; (test 0 (p))
;;; ```
;;; What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What
;;; behavior will he observe with an interpreter that uses normal-order evaluation? Explain your
;;; answer. (Assume that the evaluation rule for the special form `if` is the same whether the
;;; interpreter is using normal or applicative order: The predicate expression is evaluated first, and
;;; the result determines whether to evaluate the consequent or the alternative expression.)
;;; TODO:
