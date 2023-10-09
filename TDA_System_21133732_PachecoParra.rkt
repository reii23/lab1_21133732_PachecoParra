#lang racket

; TDA_System_21133732_PachecoParra
(require "TDA_Chatbot_21133732_PachecoParra.rkt")
(require "TDA_Flow_21133732_PachecoParra.rkt")
(require "TDA_Option_21133732_PachecoParra.rkt")
(require "TDA_User_21133732_PachecoParra.rkt")

(provide(all-defined-out))

; 7. TDA system - constructor
; Dom: name (string) X initialChatbotCodeLink (int) X chatbot* (puede recibir 0 o más chatbots)
; Recorrido: system
; Recursión: no aplica
; Descripción: Función constructora de un sistema de chatbots. Deja registro de la fecha de creación.

(define (system name InitialChatbotCodeLink . chatbots)
  (let ([unique-chatbots (remove-duplicates chatbots)])
    (list name InitialChatbotCodeLink (current-seconds) unique-chatbots '() '() '())))

; Nombre de la función: get-system-name
; Dominio: system
; Recorrido: string
; Recursión: no aplica
; Descripción: función que obtiene el nombre del sistema
(define (get-system-name system)
  (car system))

; Nombre de la función: get-system-initialChatbotCodeLink
; Dominio: system
; Recorrido: int
; Recursión: no aplica
; Descripción: función que obtiene el codigo inicial de chatbot
(define (get-system-initialChatbotCodeLink system)
  (cadr system))

; Nombre de la función: get-system-creation-time
; Dominio: system
; Recorrido: int
; Recursión: no aplica
; Descripción: función que obtiene la hora de creacion del sistema
(define (get-system-creation-time system)
  (caddr system))

; Nombre de la función: get-system-chatbots
; Dominio: system
; Recorrido: list
; Recursión: no aplica
; Descripción: función que obtiene la lista de chatbots en el sistema
(define (get-system-chatbots system)
  (cadddr system))

; Nombre de la función: get-existing-users
; Dominio: system
; Recorrido: list
; Recursión: no aplica
; Descripción: función que obtiene la lista de usuarios registrados
(define (get-existing-users system)
  (list-ref system 4))

; Nombre de la función: get-logged-in-user
; Dominio: system
; Recorrido: list
; Recursión: no aplica
; Descripción: función que obtiene la lista de usuarios logueados
(define (get-system-logged-in-user system)
  (list-ref system 5))

; Nombre de la función: get-system-chat-history
; Dominio: system
; Recorrido: list
; Recursión: no aplica
; Descripción: función que obtiene el historial de chat
(define (get-system-chat-history system)
  (list-ref system 6))

; Nombre de la función: get-current-id-chatbot
; Dominio: system
; Recorrido: int
; Recursión: no aplica
; Descripción: función que obtiene el id del chat actual
(define (get-current-id-chatbot system)
  (caar (get-system-chat-history system)))

; Nombre de la función: chatbot-exists?
; Dominio: id-chatbot (int) x chatbots (list)
; Recorrido: bool
; Recursión: no aplica
; Descripción: Función de pertenencia para verificar si un chatbot con un ID específico ya existe en una lista de chatbot
(define (chatbot-exists? chatbot-id chatbots)
  (not (null? (filter (lambda (cb) (= (get-chatbotID cb) chatbot-id)) chatbots))))

; Nombre de la función: user-exists?
; Dominio: id-chatbot (int) x chatbots (list)
; Recorrido: bool
; Recursión: no aplica
; Descripción: Función de pertenencia para verificar si un usuario ya existe en una lista de usuarios
(define (user-exists? user users)
  (member user users))

; 8. TDA system - modificador
; Nombre de la función: system-add-chatbot
; Dominio: system x chatbot
; Recorrido: system
; Recursión: no aplica
; Descripción: Función modificadora para añadir chatbots a un sistema
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

; 9. TDA system - modificador
; Nombre de la función: system-add-user
; Dominio: system x user (string)
; Recorrido: system
; Recursión: no aplica
; Descripción: Función modificadora para añadir usuarios a un sistema.
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

; 10. TDA System
; Nombre de la función: system-login
; Dominio: system x user (string)
; Recorrido: system
; Recursión: no aplica
; Descripción: Función que permite iniciar sesión en el sistema.
(define (system-login system user)
  (let ((get-existing-users (get-existing-users system))
        (logged-in-user (get-system-logged-in-user system)))
    (if (and (null? logged-in-user) (member user get-existing-users))
        (list (get-system-name system)
              (get-system-initialChatbotCodeLink system)
              (get-system-creation-time system)
              (get-system-chatbots system)
              get-existing-users
              (list user)
              (get-system-chat-history system))
        system)))

; 11. TDA System:
; Nombre de la función: system-logout
; Dominio: system
; Recorrido: system
; Recursión: no aplica
; Desc: Función que permite cerrar una sesión abierta en el sistema.
(define (system-logout system)
  (list (get-system-name system)
        (get-system-initialChatbotCodeLink system)
        (get-system-creation-time system)
        (get-system-chatbots system)
        (get-existing-users system)
        '()
        (get-system-chat-history system)
        ))

; Nombre de la función: search-chatbot
; Dominio: list-chatbot x message (string)
; Recorrido: list
; Recursión: natural
; Descripción: Función que permite obtener un chatbot según el mensaje entregado por el usuario
(define (search-chatbot list-chatbot message)
  (if (= message (caar list-chatbot))
      (car list-chatbot)
      (search-chatbot (cdr list-chatbot) message)))

; Nombre de la función: search-chatbot-flow
; Dominio: list-chatbot x message (string)
; Recorrido: list
; Recursión: natural
; Descripción: Función que permite obtener un flujo según el mensaje entregado por el usuario
(define (search-chatbot-flow list-chatbot message)
  (if (= message (caar list-chatbot))
      (list-ref (car list-chatbot) 4)
      (search-chatbot-flow (cdr list-chatbot) message)))

; Nombre de la función: search-chatbot-chat
; Dominio: list x message (string)
; Recorrido: list
; Recursión: natural
; Descripción: Función que permite obtener el chat de un chatbot
(define (search-chatbot-chat chat-h message)
  (define (search-option options message)
    (if (= (caar options) message)
        (list (get-system-initialChatbotCodeLink (car options))
              (get-chatbotcodelink (car options)))
        "no encontrado"))
  (search-option (caddr (list-ref (car chat-h) 4)) message))

; 12. system-talk-rec
; Nombre de la función: system-talk-rec
; Dominio: system X message
; Recorrido: system
; Recursión: natural
; Descripción: simula la interacción con un chatbot
(define (system-talk-rec system message)
  (if (null? (get-system-logged-in-user system))
      system
      (if (null? (get-system-chat-history system))
          (list (get-system-name system)
                (get-system-initialChatbotCodeLink system)
                (get-system-creation-time system)
                (get-system-chatbots system)
                (get-system-logged-in-user system)
                (get-existing-users system)
                (cons (search-chatbot (get-system-chatbots system) 0) (get-system-chat-history system)))
          (list (get-system-name system)
                (get-system-initialChatbotCodeLink system)
                (get-system-creation-time system)
                (get-system-chatbots system)
                (get-system-logged-in-user system)
                (get-existing-users system)
                (cons (search-chatbot-flow (get-system-chatbots system) (string->number message)) (get-system-chat-history system))))))

; Nombre de la función: search-chatbot-id
; Dominio: system
; Recorrido: int
; Recursión: no aplica
; Descripción: obtener el chatbot id actual
(define (current-chatbot-id system)
  (caar(get-system-chat-history system)))

; Nombre de la función: search-flow-id
; Dominio: system
; Recorrido: int
; Recursión: no aplica
; Descripción:; obtener el flujo id actual
(define (current-flow-id system)
  (cadddr (car (get-system-chat-history system))))

; Nombre de la función: lista-id
; Dominio: chatbot-id (int) flow-id (int)
; Recorrido: list
; Recursión: no aplica
; Descripción: crea una lista con el flujo-id y chatbot-id actual
(define (lista-id chatbot-id flow-id)
  (list (current-chatbot-id system)
        (current-flow-id system)))

; 13. system-talk-norec
; Nombre de la función: system-talk-norec
; Dominio: system X message
; Recorrido: system
; Recursión: no aplica
; Descripción: simula la interacción con un chatbot
(define (system-talk-norec system message)
  (let* ((logged-in-user (get-system-logged-in-user system))
         (chat-history (get-system-chat-history system))
         (system-name (get-system-name system))
         (initial-chatbot-code-link (get-system-initialChatbotCodeLink system))
         (creation-time (get-system-creation-time system))
         (chatbots (get-system-chatbots system))
         (existing-users (get-existing-users system)))
    (cond
      ((null? logged-in-user)
       system)
      ((null? chat-history)
       (list system-name
             initial-chatbot-code-link
             creation-time
             chatbots
             logged-in-user
             existing-users
             (cons (search-chatbot chatbots 0) chat-history)))
      (else
       (list system-name
             initial-chatbot-code-link
             creation-time
             chatbots
             logged-in-user
             existing-users
             (cons (search-chatbot-flow chatbots (string->number message)) chat-history))))))