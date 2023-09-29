#lang racket

; TDA_System_21133732_PachecoParra
(require "TDA_Chatbot_21133732_PachecoParra.rkt")
(require "TDA_Flow_21133732_PachecoParra.rkt")
(require "TDA_Option_21133732_PachecoParra.rkt")
(provide(all-defined-out))

; 7. TDA system - constructor
; Dom: name (string) X initialChatbotCodeLink (int) X chatbot* (puede recibir 0 o más chatbots)
; Rec: system
; Desc: Función constructora de un sistema de chatbots. Deja registro de la fecha de creación.

; Constructor con listas vacías para usuarios y usuarios conectados
(define (system name InitialChatbotCodeLink . chatbots)
  (let ([unique-chatbots (remove-duplicates chatbots)])
    (list name InitialChatbotCodeLink (current-seconds) unique-chatbots '() '() '())))