#lang racket

(require "TDA_Option_21133732_PachecoParra.rkt")

(provide(all-defined-out))

; 3. TDA Flow - constructor
; nombre funcion: flow
; Dominio: id (int) X name-msg (String) X Option*
; Recorrido: flow
; Recursión no aplica
; Descripción: Función constructora de un flujo de un chatbot.

(define (flow id name-msg . options)
  (list id name-msg (remove-duplicates-by-id options)))

; Nombre de la función: remove-duplicates-by-id
; Dominio: list
; Recorrido: list
; Recursión: cola
; Descripción: función que permite obtener el codigo de flujo

(define (remove-duplicates-by-id options)
  (define (check-and-append opt acc)
    (if (option-exists? opt acc)
        acc
        (append acc (list opt))))
  (foldl check-and-append '() options))

; Nombre de la función: get-id
; Dominio: flow
; Recorrido: int
; Recursión: cola
; Descripción: función que permite obtener el codigo de flujo
(define (get-id flow)
  (car flow))

; Nombre de la función: get-name-msg
; Dominio: flow
; Recorrido: string
; Recursión: no aplica
; Descripción: función que permite obtener el mensaje del flujo
(define (get-name-msg flow)
  (cadr flow))

; Nombre de la función: get-options
; Dominio: flow
; Recorrido: list
; Recursión: no aplica
; Descripción: función que permite obtener la lista de opciones de flow
(define (get-options flow)
  (caddr flow))

; Nombre de la función: get-options
; Dominio: list x list
; Recorrido: bool
; Recursión: no aplica
; Descripción: función que permite obtener si una opcion existe o no dentro de la lista
(define (option-exists? option options)
  (not (null? (filter (lambda (opt) 
                       (and (number? (get-id opt))
                            (number? (get-id option))
                            (= (get-id opt) (get-id option)))) options))))

; 4. TDA Flow - modificador
; Nombre funcion: flow-add-option
; Dominio: flow x option
; Recorrido: flow
; Recursión: no aplica
; Descripción: Funcion modificadora para añadir opciones a un flujo

(define (flow-add-option new-flow option)
  (if (option-exists? option (get-options new-flow))
      new-flow
      (new-flow (get-id new-flow) (get-name-msg new-flow) (append (get-options new-flow) (list option)))))
