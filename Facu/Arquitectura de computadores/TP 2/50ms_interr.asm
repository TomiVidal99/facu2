;
; problema_9_interrupciones.asm
;
; Created: 24/5/2024 11:17:39
; Author : Tomás Vidal
; Implemento delay de 50ms con interrupciones
; Supongo que corre con un reloj de 16MHz

.include "m328pdef.inc"

; renombro los registros
.def TEMP = r16
.def LED_STATUS = r17
.def OF_COUNTER = r18 ; contador de overflows en comparacion

; defino constantes
.equ LED_PIN = PB5 ; pin 13 de la placa
.equ MAX_OVERFLOWS = 5
.equ OCR0A_VALUE = 155

; macro para cargar valor
; a registro de IO
.macro lior
  ldi TEMP, @1
  out @0, TEMP
.endmacro

; configuro los registros del timer 0 (8 bits)
; para que dispare una interrupcion cada 50ms
.macro sut
  ; seteo el modo de normal para disparar
  ; interrupciones en comparacion con OCR0A
  ldi TEMP, (1 << WGM01)
  out TCCR0A, TEMP

  ; ajusto la pre escala
  ldi TEMP, (1 << CS02) | (1 << CS00)
  out TCCR0B, TEMP

  ; ajusto el valor con el que el CTC compara
  ldi TEMP, OCR0A_VALUE
  out OCR0A, TEMP

  ; configuro para que se dispare una interrupcion
  ; cada vez que el contador iguala a OCR0A
  ldi TEMP, (1 << OCIE0A)
  sts TIMSK0, TEMP
.endmacro

; defino el vector RESET
; y el vector de interrupcion
.org 0x0000   rjmp RESET
.org OC0Aaddr rjmp INT0_OF

; ------------------------------
; ----------- SETUP ------------
; ------------------------------
RESET:
  ; inicializo la pila
  lior SPH, HIGH(RAMEND)
  lior SPL, LOW(RAMEND)

  ; inicio el pin como salida
  sbi DDRB, LED_PIN

  sut ; set up timer

  sei ; habilita las interrupciones
; --------------------------------------------------------------------------------

; ------------------------------
; ---------- MAIN LOOP ---------
; ------------------------------
MAIN_LOOP:
  ; Aca iria la tarea de background
  ; cada vez que la interrupcion se dispara
  ; esta tarea se detiene, se antiende la interrupcion
  ; y luego de que se termina la tarea de interrupcion
  ; se continua con la tarea de background
  rjmp MAIN_LOOP
; --------------------------------------------------------------------------------


; --------------------------------------------------------------------------------
; esta es la rutina que se llama cuando la
; interrupcion del timer se dispara
INT0_OF:
  ; incremento el contador de overflow
  inc OF_COUNTER
  cpi OF_COUNTER, MAX_OVERFLOWS
  brne END_ISR

  ldi OF_COUNTER, 0

  rcall TOGGLE_PIN

END_ISR:
  reti
; --------------------------------------------------------------------------------

; --------------------------------------------------------------------------------
; conmuto la salida del LED
TOGGLE_PIN:
  in LED_STATUS, PORTB
  ldi TEMP, (1 << LED_PIN)
  eor LED_STATUS, TEMP
  out PORTB, LED_STATUS

  ret
; --------------------------------------------------------------------------------
