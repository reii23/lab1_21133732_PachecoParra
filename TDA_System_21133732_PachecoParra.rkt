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

(define (get-system-creation-time system)
  (caddr system))

(define (get-system-chatbots system)
  (cadddr system))

(define (get-existing-users system)
  (list-ref system 4))

(define (get-system-logged-in-user system)
  (list-ref system 5))

(define (get-system-chat-history system)
  (list-ref system 6))

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
                  (get-system-chatbots system)
                  (get-existing-users system)
                  (get-system-logged-in-user system)
                  (get-system-chat-history system)))
        system)))

; register
; 9. TDA system - modificador
; Dom: system x user (string)
; Rec: system
; Desc: Función modificadora para añadir usuarios a un sistema.
; Req: Debe verificar que el usuario no exista en el sistema a partir del id de éste, que está dado por su nombre de usuario (String).
; Idea: crear una nueva funcion la cual reciba el system y el user y lo añada en el sistema en una nueva lista donde se vayan agregando los usuarios.

; Función auxiliar para verificar si un usuario ya existe en una lista de usuarios
(define (user-exists? user users)
  (member user users))

(define (system-add-user system user)
    (if (not (member user (get-existing-users system)))
        (list (get-system-name system)
              (get-system-initialChatbotCodeLink system)
              (get-system-creation-time system)
              (get-system-chatbots system)
              (cons user (get-existing-users system))
              (get-system-logged-in-user system)
              (get-system-chat-history system))
        system))
