#lang racket

(require "TDA_Flow_21133732_PachecoParra.rkt")
(require "TDA_Option_21133732_PachecoParra.rkt")
(require "TDA_Chatbot_21133732_PachecoParra.rkt")
(require "TDA_System_21133732_PachecoParra.rkt")
(require "TDA_ChatHistory_21133732_PachecoParra.rkt")
(require "TDA_User_21133732_PachecoParra.rkt")

; PRUEBAS

(define op1 (option  1 "1) Viajar" 1 1 "viajar" "turistear" "conocer")) ; verifica RFN 2

(define op2 (option  2 "2) Estudiar" 2 1 "estudiar" "aprender" "perfeccionarme")) ; verifica RFN 2

(define f10 (flow 1 "flujo1" op1 op2 op2 op2 op2 op1))

(define f11 (flow-add-option f10 op1)) ;se intenta añadir opción duplicada verifica RFN 4

(define cb0 (chatbot 0 "Inicial" "Bienvenido\n ¿Qué te gustaría hacer?" 1 f10 f10 f10 f10))  ;solo añade una ocurrencia de f10, verifica RFN 5

(define f12 (flow-add-option f11 op2)) ; definir f12 ya que será necesario para verificar el correcto funcionamiento del RFN 6

;(define cb11 (chatbot 0 "Asistente" "Bienvenido\n¿Qué te gustaría hacer?"  f12)) ; Ejemplo RFN 5 alternativo, para que RFN 6 sea correcto, este cb11 debe ser igual al cb11 de abajo

(define cb11 (chatbot-add-flow cb0 f12)) ; probar este ejemplo y verificar que este y el de arriba son iguales, se puede comentar y descomentar para probarlo

(define s0 (system "Chatbots Paradigmas" 0 cb0 cb0 cb0)) ; RFN 7 añade solo un cb0 RFN 7

(define s1 (system-add-chatbot s0 cb0)) ; RFN 8

; RFN 9
(define s2 (system-add-user s1 "user1"))
(define s3 (system-add-user s2 "user2"))
(define s4 (system-add-user s3 "user2")) ;solo añade un ocurrencia de user2 (no permite logear dos usuarios iguales)
(define s5 (system-add-user s4 "user3")) ; se agrega user 3

; RFN 10
(define s6 (system-login s5 "user8")) ;user8 no existe. No inicia sesión
(define s7 (system-login s6 "user1"))
(define s8 (system-login s7 "user2"))  ;no permite iniciar sesión a user2, pues user1 ya inició sesión

(define s9 (system-logout s8)) ;  RFN 11: cierra sesión el usuario
(define s10 (system-login s9 "user2"))