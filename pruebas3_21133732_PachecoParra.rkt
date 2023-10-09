#lang racket/base

; Pruebas3
; script de pruebas creado por mi para simular un chatbot de cocina

(require "TDA_Flow_21133732_PachecoParra.rkt")
(require "TDA_Option_21133732_PachecoParra.rkt")
(require "TDA_Chatbot_21133732_PachecoParra.rkt")
(require "TDA_System_21133732_PachecoParra.rkt")
(require "TDA_ChatHistory_21133732_PachecoParra.rkt")
(require "TDA_User_21133732_PachecoParra.rkt")

(define op1 (option 1 "1) Cocinar postres" 1 1 "postres" "dulce" "repostería")) ;crea la opcion1
(define op2 (option 2 "2) Cocinar platos fuertes" 2 1 "platos fuertes" "cena" "almuerzo")) ;crea la opcion2
(define op3 (option 3 "3) Cocinar comida chilena" 1 1 "comida chilena" "chile")) ;crea la opcion3

(define f10 (flow 1 "Flujo Principal Chatbot Cocina\nBienvenido\n¿Qué te gustaría cocinar?" op1 op2 op2 op2 op1 op3)) ; crea el flujo respecto a las opciones sin repetir opciones
(define f11 (flow-add-option f10 op3)) ; no agrega un flow ya que existe
(define f12 (flow-add-option f11 op2)) ;no agrega un flow ya que existe
(define f13 (flow-add-option f12 op1)) ; no agrega un flow ya que existe

(define cb0 (chatbot 0 "Inicial" "Bienvenido\n¿Qué te gustaría cocinar?" 1 f13 f12 f12)) ; crea un chatbot con flows con igual id asi que debe entregar solo 1
(define op4 (option 1 "1) Torta de chocolate" 1 2 "chocolate" "torta" "pastel")) ; se crea la opcion4
(define op5 (option 2 "2) Galletas de avena" 1 1 "galletas" "avena")) ; se crea la opcion5
(define op6 (option 3 "3) Brownies" 1 1 "brownies")) ; se crea la opcion6
(define op7 (option 4 "4) Volver" 0 1 "Regresar" "Salir" "Volver")) ; se crea la opcion7

(define f20 (flow 1 "Flujo 1 Chatbot Cocina\n¿Qué postre te gustaría preparar?" op4 op4 op5 op6 op7 op7)) ; se crea un flujo que tiene la opcion 4,5,6 y 7, nuevamente, evita id duplicados.
(define cb1 (chatbot 1 "Recetas de Postres" "Bienvenido\n¿Qué postre quieres preparar?" 1 f20)) ; se crea un chatbot con el flujo 20
(define cb3 (chatbot-add-flow cb1 f10)) ; se intenta agregar un flujo a un chatbot que ya posee el flujo
(define cb4 (chatbot-add-flow cb3 f11)) ;se intenta agregar un flujo a un chatbot que ya posee el flujo
(define cb5 (chatbot-add-flow cb0 f12)) ;se intenta agregar un flujo a un chatbot que ya posee el flujo

(define op8 (option 1 "1) Lasagna" 2 1 "lasagna")) ; se crea la opcion8
(define op9 (option 2 "2) Cazuela" 2 1 "cazuela" "sopa")) ; se crea la opcion9
(define op10 (option 3 "3) Volver" 0 1 "Volver" "Salir" "Regresar")) ; se crea la opcion10
(define f30 (flow 1 "Flujo 1 Chatbot Cocina\n¿Qué plato fuerte te gustaría preparar?" op8 op9 op10)) ; se crea un flow en base a las opciones
(define cb2 (chatbot 2 "Recetas Platos Fuertes" "Bienvenido\n¿Qué plato fuerte te gustaría preparar?" 1 f30 f30)) ; se crea un chatbot con el flujo30, nuevamente si se ingresa dos veces, evita duplicidad
(define s0 (system "Chatbots Cocina" 0 cb0 cb0 cb1 cb2 cb2)) ; se crea un sistema con los chatbots cb0 cb1 y cb2

(define s1 (system-add-chatbot s0 cb0)) ; se intenta agregar un chatbot que se repite
(define s20 (system-add-chatbot s0 cb2)) ; se intenta agregar un chatbot que se repite
(define s21 (system-add-chatbot s0 cb1)) ; se intenta agregar un chatbot que se repite

(define s2 (system-add-user s1 "Reinaldo")) ;se agrega el usuario "Reinaldo"
(define s3 (system-add-user s2"Gonzalo")) ;se agrega el usuario "Gonzalo"
(define s4 (system-add-user s3 "Juanito")) ;se agrega el usuario "Juanito"
(define s5 (system-login s4 "Reinaldo")) ; se logea el usuario "Reinaldo"
(define s6 (system-login s5 "Gonzalo")) ; no se puede logear el usuario Gonzalo debido a que ya existe un usuario logeado en el sistema

(define s7 (system-logout s6)) ; deslogea al usuario en el sistema
(define s8 (system-login s7 "Juanito")) ;logea al usuario Juanito
(define s9 (system-logout s8)) ; deslogea al usuario en el sistema
(define s10 (system-login s9 "Pedro")) ;no se puede logear el usuario Pedro ya que no está registrado en el sistema
(define s11 (system-login s10 "Gonzalo")) ;se logea el usuario "Gonzalo"
(define s41 (system-logout s11))
(define s42 (system-login s41 "Juanito"))

(define s43 (system-talk-rec s42 "Hola")) ;se realiza una interacción con el usuario
(define s44 (system-talk-rec s43 "1")) ;se realiza una interacción con el usuario
(define s45 (system-talk-rec s44 "1")) ;se realiza una interacción con el usuario
(define s46 (system-talk-rec s45 "2"))
(define s47 (system-talk-norec s42 "Hola")) ;se realiza una interacción con el usuario
(define s48 (system-talk-norec s47 "1")) ;se realiza una interacción con el usuario
(define s49 (system-talk-norec s48 "1")) ;se realiza una interacción con el usuario
(define s50 (system-talk-norec s49 "2"))
