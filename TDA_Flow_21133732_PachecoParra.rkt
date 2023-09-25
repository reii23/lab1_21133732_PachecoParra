#lang racket

; TDA_Flow_21133732_PachecoParra

(require "TDA_Option_21133732_PachecoParra.rkt")

(provide(all-defined-out))

; 3. TDA_Flow - constructor
; nombre funcion: flow
; Dom: id (int) X name-msg (String) X Option*
; Recorrido: flow
; Descripción: Función constructora de un flujo de un chatbot.
; Requisitos: Usar estructuras basadas en listas y/o pares
; Flujos quedan identificados por un ID único. Su unicidad se verifica al momento de agregarlo a un chatbot a fin de evitar duplicidad. La función también verifica que las opciones añadidas no se repitan en base al id de éstos.

(define (flow id name-msg . options)
  (list id name-msg (remove-duplicates-by-id options)))

; Funcion para eliminar los id duplicados
(define (remove-duplicates-by-id options)
  (foldl 
   (lambda (opt acc)
     (if (option-exists? opt acc)
         acc
         (append acc (list opt))))
   '()
   options))

; SELECTORES:
(define (get-id flow)
  (car flow))

(define (get-name-msg flow)
  (cadr flow))

(define (get-options flow)
  (caddr flow))

; PERTENENCIA

(define (option-exists? option options)
  (not (null? (filter (lambda (opt) 
                       (and (number? (get-id opt))
                            (number? (get-id option))
                            (= (get-id opt) (get-id option)))) options))))

; 4. TDA Flow - modificador
; nombre funcion: flow-add-option
; Dom: Flow X Option
; Rec: flow
; Desc: Funcion modificadora para añadir opciones a un flujo
; Req: No usar recursión La función también verifica que las opciones añadidas no se repitan en base al id de éstos

(define (flow-add-option new-flow option)
  (if (option-exists? option (get-options new-flow))
      new-flow
      (new-flow (get-id new-flow) (get-name-msg new-flow) (append (get-options new-flow) (list option)))))
