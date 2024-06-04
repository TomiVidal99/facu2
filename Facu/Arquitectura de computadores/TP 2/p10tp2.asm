;
; problema_10_tp2.asm
;
; Created: 30/5/2024 17:10:46
; Author : Tomás Vidal
;
; Se resuelve el problema 10 del TP 2
; Se asume que el reloj es de 16MHz
; Asumo que el detector es un activo a bajo,
; si fuera activo a alto habria que cambiar
; el flanco que dispara la interrupcion

.include "m328pdef.inc"

; renombro los registros
.def TEMP = r16
.def LED_STATUS = r17
.def DETECTOR_STATUS = r18
.def SIG_CNTR = r19 ; contador de las intermitencias enviadas

; defino constantes
.equ LED_PIN = PB5 ; pin 13 de la placa
.equ DET_PIN = PD2 ; pin 2 de la placa
.equ SIG_MAX_CNT = 10 ; cuantas intermitencias se envian por deteccion
.equ TOP_TIMER = 7812

; macro para cargar valor
; a registro de IO
.macro lior
  ldi TEMP, @1
  out @0, TEMP
.endmacro

; se configura un timer de 500ms
; que dispara una interrupcion
; timer1 (16 bits)
.macro sut
  ; ajusto la pre escala y el modo CTC
  ldi TEMP, (1 << CS12) | (1 << CS10) | (1 << WGM12)
  sts TCCR1B, TEMP

  ; ajusto el valor con el que el CTC compara
  ldi TEMP, LOW(TOP_TIMER)
  sts OCR1AL, TEMP
  ldi TEMP, HIGH(TOP_TIMER)
  sts OCR1AH, TEMP

  ; habilito el timer1
  ldi TEMP, (1 << OCIE1A)
  sts TIMSK1, TEMP

.endmacro

; defino el vector RESET
; y el vector de interrupcion
.org 0x0000   rjmp RESET
.org INT0addr rjmp INT_DET
.org OC1Aaddr rjmp TIMER1_COMPA_ISR

; ------------------------------
; ----------- SETUP ------------
; ------------------------------
RESET:
  ; inicializo la pila
  lior SPH, HIGH(RAMEND)
  lior SPL, LOW(RAMEND)

  ; inicio el pin como salida
  sbi DDRB, LED_PIN

  ; seteo para que la interrupcion del pin 2 se haga en
  ; flanco de bajada
  ldi TEMP, (1 << ISC01)
  sts EICRA, TEMP

  ; habilito las interrupciones externas
  ldi TEMP, (1 << INT0)
  out EIMSK, TEMP

  rcall ELP; hablito el bajo consumo

  sei ; habilita las interrupciones
; --------------------------------------------------------------------------------

; ------------------------------
; ---------- MAIN LOOP ---------
; ------------------------------
MAIN_LOOP:
  rjmp MAIN_LOOP
; --------------------------------------------------------------------------------

; --------------------------------------------------------------------------------
; esta es la rutina que se llama cuando la
; interrupcion del detector se dispara
INT_DET:
  rcall DLP ; desabilita el bajo consumo

  ; Reset signal counter
  ldi SIG_CNTR, 0

  ; Comienzo con el LED apagado
  ldi TEMP, 0
  out PORTB, TEMP

  sut ; inicio el loop de intermitencia del LED

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

; --------------------------------------------------------------------------------
; esta es la rutina que se llama cuando la
; interrupcion de compare match se dispara
TIMER1_COMPA_ISR:
  rcall TOGGLE_PIN

  inc SIG_CNTR

  ; ver si se llego a 5 segundos
  cpi SIG_CNTR, SIG_MAX_CNT
  brne TIMER1_COMPA_ISR_END

  ; si se llego a los 5 segundos se para el timer1
  ldi TEMP, 0
  sts TIMSK1, TEMP

  rcall ELP ; se habilita el bajo consumo nuevamente

TIMER1_COMPA_ISR_END:
  reti
; --------------------------------------------------------------------------------


; --------------------------------------------------------------------------------
; se habilita el bajo consumo
; se usa el modo: power-down
; porque permite interrupciones de pines externos
ELP:
  ldi TEMP, (1 << SE) | (1 << SM1)
  out SMCR, TEMP
  ret
; --------------------------------------------------------------------------------

; --------------------------------------------------------------------------------
; desabilita el bajo consumo
DLP:
  ldi TEMP, 0
  out SMCR, TEMP
  ret
; --------------------------------------------------------------------------------
