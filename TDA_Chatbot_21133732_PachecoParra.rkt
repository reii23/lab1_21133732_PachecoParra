#lang racket/base

(provide(all-defined-out))

(require "TDA_Flow_21133732_PachecoParra.rkt")
(require "TDA_Option_21133732_PachecoParra.rkt")

; 5. TDA Chatbot - constructor
; nombre funcion: chatbot
; Dom: chatbotID (int) X name (String) X welcomeMessage (String) X startFlowId (int)  X  flows*
; Recorido: chatbot
; Recursion: no aplica
; Descripción: Funcion constructora de un chatbot

(define (chatbot chatbotID name welcomeMessage startFlowId . flows)
  (list chatbotID name welcomeMessage startFlowId (remove-duplicates flows)))

; Nombre de la función: remove-duplicates
; Dominio: list
; Recorrido: list
; Recursión: cola
; Descripción: función que elimina los flujos duplicados en base a su id
(define (remove-duplicates flows)
  (foldl 
   (lambda (flow acc)
     (if (flow-exists? flow acc)
         acc
         (append acc (list flow))))
   '()
   flows))

; Nombre de la función:get-chatbotID
; Dominio: chatbot
; Recorrido: int
; Recursión: no aplica
; Descripción: función que selecciona el id del chatbot
(define (get-chatbotID chatbot)
  (car chatbot))

; Nombre de la función:get-name-chatbot
; Dominio: chatbot
; Recorrido: string
; Recursión: no aplica
; Descripción: función que seleciona el nombre del chatbot 
(define (get-name-chatbot chatbot)
  (cadr chatbot))

; Nombre de la función: get-welcomeMessage
; Dominio: chatbot
; Recorrido: string
; Recursión: no aplica
; Descripción: función que seleciona el mensaje de bienvenida del chatbot
(define (get-welcomeMessage chatbot)
  (caddr chatbot))

; Nombre de la función:get-startFlowId
; Dominio: chatbot
; Recorrido: int
; Recursión: no aplica
; Descripción: función que seleciona el id de flujo inicial del chatbot
(define (get-startFlowId chatbot)
  (cadddr chatbot))

; Nombre de la función:get-flows
; Dominio: chatbot
; Recorrido: list
; Recursión: no aplica
; Descripción: función que seleciona los flujos del chatbot
(define (get-flows chatbot)
  (car (cddddr chatbot)))

; Nombre de la función: flow-exists?
; Dominio: chatbot x flow
; Recorrido: bool
; Recursión: no aplica
; Descripción: Función de pertenencia para verificar si un flujo ya existe en una lista dada de flujos. dado su id
(define (flow-exists? flow flows)
  (not (null? (filter (lambda (fl) (= (get-id fl) (get-id flow))) flows))))

; 6. TDA chatbot - modificador
; Nombre función: chatbot-add-flow
; Dominio: chatbot x flow
; Recorrido: list
; Recursión: cola
; Descripción: Función modificadora para añadir flujos a un chatbot.
(define (chatbot-add-flow chatbot flow)
  (let ([flows (get-flows chatbot)])
    (define (aux-flow-adder flows flow)
      (cond
        [(null? flows) (list flow)]
        [(flow-exists? flow flows) flows]
        [else (append flows (list flow))]))
    (list (get-chatbotID chatbot)(get-name-chatbot chatbot) (get-welcomeMessage chatbot) (get-startFlowId chatbot)(aux-flow-adder flows flow))))
