;
; problema_9.asm
;
; Created: 18/5/2024 22:51:21
; Author : tomi
;
;	Supongo que el clock es de 16MHz
;	Entonces 0.05s -> 800 000 ciclos de reloj
;

.include "m328pdef.inc"

; Comenzar en la posición cero
.org 0x0000

; Ir al vector de reset
rjmp RESET

RESET:
  ; inicializo el stack pointer
  ; para simulacion no hace falta
  ; pero para programar el micro si
  ldi r16, LOW(RAMEND)
  out SPL, r16
  ldi r16, HIGH(RAMEND)
  out SPH, r16

  ; seteo el pin 3 (del arduino) como salida
  sbi DDRD, PD3

MAIN_LOOP:
  call PIN_HIGH
  call DELAY_50MS
  call PIN_LOW
  call DELAY_50MS 

  rjmp MAIN_LOOP

DELAY_50MS:
    ldi r20, 70
outer_loop:
    ldi r19, 38
middle_loop:
    ldi r18, 100
inner_loop:
    dec r18
    brne inner_loop
    dec r19
    brne middle_loop
    dec r20
    brne outer_loop
    ret

PIN_HIGH:
  sbi PORTD, PD3
  ret

PIN_LOW:
  cbi PORTD, PD3
  ret
