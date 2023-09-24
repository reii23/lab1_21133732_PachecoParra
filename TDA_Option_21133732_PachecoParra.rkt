#lang racket

(provide(all-defined-out))
        
; TDA_Option_21133732_PachecoParra

; --------------------------------------
; 2.
; TDA Option - constructor
; nombre funcion: option
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X InitialFlowCodeLink (Int) X Keyword*
; Recorrido: option
; Descripción: Función constructora de una opción para flujo de un chatbot. Cada opción se enlaza a un chatbot y flujo especificados por sus respectivos códigos.
; Requisitos de implementación: Usar estructuras basadas en listas y/o pares. El código de un option es único.  Su unicidad se verifica al momento de agregarlo a un flow a fin de evitar duplicidad.

(define (option code message ChatbotCodeLink InitialFlowCodeLink . keywords)
  (list code message ChatbotCodeLink InitialFlowCodeLink keywords))

; Selectores:
; ejemplos de uso:
; (get-code op1)
; (get-message op2)

(define (get-code option)
  (car option))

(define (get-message option)
  (cadr option))

(define (get-chatbotcodelink option)
  (cadr option))

(define (get-initialflowcodelink option)
  (cadddr option))

(define (get-keywords option)
  (car (cddddr option)))

(define op1 (option  1 "1) Viajar" 1 1 "viajar" "turistear" "conocer")) ; verifica RFN 2

(define op2 (option  2 "2) Estudiar" 2 1 "estudiar" "aprender" "perfeccionarme")) ; verifica RFN 2

