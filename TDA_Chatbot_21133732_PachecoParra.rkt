#lang racket/base

; TDA_Chatbot_21133732_PachecoParra

(provide(all-defined-out))

(require "TDA_Flow_21133732_PachecoParra.rkt")
(require "TDA_Option_21133732_PachecoParra.rkt")

; 5. TDA Chatbot - constructor
; nombre funcion: chatbot
; Dom: chatbotID (int) X name (String) X welcomeMessage (String) X startFlowId (int)  X  flows*
; Rec: chatbot
; Desc: Funcion constructora de un chatbot

(define (chatbot chatbotID name welcomeMessage startFlowId . flows)
  (list chatbotID name welcomeMessage startFlowId (remove-duplicates flows)))

; Función auxiliar para verificar si un flujo ya existe en una lista dada de flujos.
(define (flow-exists? flow flows)
  (not (null? (filter (lambda (fl) (= (get-id fl) (get-id flow))) flows)))) ; Compara los ID de los flujos.

; Función auxiliar para eliminar flujos duplicados basándose en su ID.
(define (remove-duplicates flows)
  (foldl 
   (lambda (flow acc) ; Toma un flujo y la lista acc
     (if (flow-exists? flow acc) ; Si el flujo ya existe en la lista acc
         acc ; devuelve la lista acc sin cambios
         (append acc (list flow)))) ;sino añade el flujo a la lista acumulada.
   '()
   flows))

; Selectores

(define (get-chatbotID chatbot)
  (car chatbot))

(define (get-name-chatbot chatbot)
  (cadr chatbot))

(define (get-welcomeMessage chatbot)
  (caddr chatbot))

(define (get-startFlowId chatbot)
  (cadddr chatbot))

(define (get-flows chatbot)
  (car (cddddr chatbot)))

; 6. TDA chatbot - modificador
; nombre funcion: chatbot-add-flow
; Dom: chatbot X flow
; Rec: chatbot
; Desc: Función modificadora para añadir flujos a un chatbot.
; Requirements: Usar recursión de cola o natural para añadir flujos al final de la lista de flujos. La función también verifica que los flujos añadidos no se repitan en base al id de éstos.
; Recursion de cola, ya que utilizamos un aux llamado aux-flow-adder

(define (chatbot-add-flow chatbot flow)
  (let ([flows (get-flows chatbot)])
    (define (aux-flow-adder flows flow)
      (cond
        [(null? flows) (list flow)]
        [(flow-exists? flow flows) flows]
        [else (append flows (list flow))]))
    (list (get-chatbotID chatbot)(get-name-chatbot chatbot) (get-welcomeMessage chatbot) (get-startFlowId chatbot)(aux-flow-adder flows flow))))
