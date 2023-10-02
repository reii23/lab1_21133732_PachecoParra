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

; SELECTORES

(define (get-system-name system)
  (car system))

(define (get-system-initialChatbotCodeLink system)
  (cadr system))

(define (get-system-chatbots system)
  (cadddr system))

(define (get-system-creation-time system)
  (caddr system))

(define (get-system-logged-in-user system)
  (cadr (cddddr system)))

(define (get-system-chat-history system)
  (caddr (cddddr system)))

; 8. TDA system - modificador
; Dom: system x chatbot
; Rec: system
; Desc: Función modificadora para añadir chatbots a un sistema

; Función auxiliar para verificar si un chatbot con un ID específico ya existe en una lista de chatbots
(define (chatbot-exists? chatbot-id chatbots)
  (not (null? (filter (lambda (cb) (= (get-chatbotID cb) chatbot-id)) chatbots))))

(define (system-add-chatbot system chatbot)
  (let ((existing-chatbots (get-system-chatbots system))
        (chatbot-id (get-chatbotID chatbot)))
    (if (not (chatbot-exists? chatbot-id existing-chatbots))
        (let ((updated-chatbots (remove-duplicates (append existing-chatbots (list chatbot)))))
            (list (get-system-name system)
                  (get-system-initialChatbotCodeLink system)
                  (get-system-creation-time system)
                  updated-chatbots
                  (car (cddddr system))
                  (cadr (cddddr system))
                  (get-system-chat-history system)))
        system)))