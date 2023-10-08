#lang racket/base

;TDA_User_21133732_PachecoParra.rkt

(provide(all-defined-out))

; Nombre de la función: make-user
; Dominio: username (string)
; Recorrido: make-user
; Recursión: no aplica
; Descripción: función constructora que crea un usuario en base a su nombre de usuario
(define (make-user username)
  (list username))

; Nombre de la función: get-username
; Dominio: user
; Recorrido: string
; Recursión: no aplica
; Descripción: función seletora que obtiene el nombre de usuario de un ususario
(define (get-username user)
  (car user))




