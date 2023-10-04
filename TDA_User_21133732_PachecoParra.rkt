#lang racket/base

;TDA_User_21133732_PachecoParra.rkt

(provide(all-defined-out))

; TDA_User - constructor
; Dom: username (string)
; Rec: user
(define (make-user username)
  (list username))

; SELECTORES
(define (get-username user)
  (car user))

(define (system-current-user sys)
  (make-user sys))



