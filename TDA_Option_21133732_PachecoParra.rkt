#lang racket

; TDA_Option_21133732_PachecoParra

; --------------------------------------
; 2.
; TDA Option - constructor
; nombre funcion: flow
; Dominio: code (Int)  X message (String)  X ChatbotCodeLink (Int) X FlowCodeLink (Int) X Keyword*
; Recorrido: option
; Descripción: Función constructora de una opción para flujo de un chatbot. Cada opción se enlaza a un chatbot y flujo especificados por sus respectivos códigos.
; Requisitos de implementación: Usar estructuras basadas en listas y/o pares. El código de un option es único.  Su unicidad se verifica al momento de agregarlo a un flow a fin de evitar duplicidad.

(define (option code message ChatbotCodeLink FlowCodeLink . keywords)
  (list code message ChatbotCodeLink FlowCodeLink keywords))