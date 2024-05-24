;
; problema_9_interrupciones.asm
;
; Created: 24/5/2024 11:17:39
; Author : tomi
; Implemento delay de 50ms con interrupciones
;

.include "m328pdef.inc"

; Define constants
.equ LED_PIN = PD3

.org 0x0000
rjmp RESET

RESET:
    ; Initialize the stack pointer
    ldi r16, LOW(RAMEND)
    out SPL, r16
    ldi r16, HIGH(RAMEND)
    out SPH, r16

    ; Set LED_PIN as output
    sbi DDRD, LED_PIN

    ; Initialize Timer1 for 50ms interval
    ldi r16, 0x00
    out TCCR1A, r16          ; Normal mode
    ldi r16, (1 << WGM12)    ; CTC mode
    out TCCR1B, r16
    ldi r16, HIGH(24999)     ; Set OCR1A for 50ms interval
    out OCR1AH, r16
    ldi r16, LOW(24999)
    out OCR1AL, r16
    ldi r16, (1 << CS12) | (1 << CS10) ; Prescaler 1024
    out TCCR1B, r16
    ldi r16, (1 << OCIE1A)   ; Enable Timer1 compare match interrupt
    out TIMSK1, r16

    ; Enable global interrupts
    sei

MAIN_LOOP:
    ; Main loop can perform other tasks
    rjmp MAIN_LOOP

; Timer1 compare match A interrupt service routine
.org OC1Aaddr
ISR_TIMER1_COMPA:
    in r16, PORTD
    eor r16, (1 << LED_PIN)
    out PORTD, r16
    reti
