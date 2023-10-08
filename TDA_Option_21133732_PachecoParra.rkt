#lang racket

(provide(all-defined-out))
        
; 2.
; TDA Option - constructor
; Nombre Funcion: option
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X InitialFlowCodeLink (Int) X Keyword*
; Recorrido: option
; Recursión: no aplica
; Descripción: función constructora de una opción para flujo de un chatbot.

(define (option code message ChatbotCodeLink InitialFlowCodeLink . keywords)
  (list code message ChatbotCodeLink InitialFlowCodeLink keywords))

; Nombre de la función: get-code
; Dominio: option
; Recorrido: int
; Recursión: no aplica
; Descripción: función que permite obtener el codigo de la opción
(define (get-code option)
  (car option))

; Nombre de la función: get-message
; Dominio: option
; Recorrido: string
; Recursión: no aplica
; Descripción: función que permite obtener el mensaje
(define (get-message option)
  (cadr option))

; Nombre de la función: get-chatbotcodelink
; Dominio: option
; Recorrido: int
; Recursión: no aplica
; Descripción: función que permite obtener el codigo de union con el chatbot
(define (get-chatbotcodelink option)
  (cadr option))

; Nombre de la función: get-initialflowcodelink
; Dominio: option
; Recorrido: int
; Recursión: no aplica
; Descripción: función que permite obtener el codigo de flujo
(define (get-initialflowcodelink option)
  (cadddr option))

; Nombre de la función: get-keywords
; Dominio: option
; Recorrido: keyword (list)
; Recursión: no aplica
; Descripción: función que permite obtener una lista con las palabras clave de la opción
(define (get-keywords option)
  (car (cddddr option)))

; Ejemplos de uso para probar el correcto uso de las opciones

; Nombre de la función: op1
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X InitialFlowCodeLink (Int) X Keyword*
; Recorrido: option
; Recursión: no aplica
; Descripción: función que construye una lista con los elementos de una opción
(define op1 (option  1 "1) Viajar" 1 1 "viajar" "turistear" "conocer")) ; verifica RFN 2

; Nombre de la función: op2
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X InitialFlowCodeLink (Int) X Keyword*
; Recorrido: option
; Recursión: no aplica
; Descripción: función que construye una lista con los elementos de una opción
(define op2 (option  2 "2) Estudiar" 2 1 "estudiar" "aprender" "perfeccionarme")) ; verifica RFN 2

