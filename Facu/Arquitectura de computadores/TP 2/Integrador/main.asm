;
; proyecto_integrador_tp2.asm
;
; Created: 31/5/2024 10:19:48
; Author : Tomás Vidal
;
; Implemento el algoritmo de bubble sort
; La obtencion de numeros aleatorios se hace
; haciendo lecturas del ADC

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  Constantes - - - - -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
.set VEC_LEN = 255
.set VEC_START_ADDR = 0x0100
.set ADC_CHANNEL = PD0

.def TEMP = r16
.def adc_low = r17
.def Counter = r18

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  MACROS - - - - -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; macro para cargar valor
; a registro de IO
.macro lior
  ldi TEMP, @1
  out @0, TEMP
.endmacro

; TODO: creo que no voy a necesitar el reg X al final
.macro LDX
ldi r26, LOW(@0)
ldi r27, HIGH(@0)
.endmacro
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  SETUP  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
.org 0x0000 rjmp RESET

.dseg
.org VEC_START_ADDR VECT: .byte VEC_LEN

.cseg
RESET:
  ; inicializo el Stack Pointer
  lior SPL, LOW(RAMEND)
  lior SPH, HIGH(RAMEND)

  rcall INIT_ADC

  rcall CREATE_RND_VECT
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  MAIN  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
MAIN_LOOP:
  rjmp MAIN_LOOP

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  FUNCIONES  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
CREATE_RND_VECT:
  ldi Counter, VEC_LEN
  ldx VEC_START_ADDR

push_element:
  ; empujar un nuevo valor al vector
  rcall READ_ADC
  st X+, adc_low

  ; continuar iterando si no se llego a completar el vector
  dec Counter
  brne push_element

  ret

INIT_ADC:
  ldi TEMP, (1<<REFS0)
  sts ADMUX, TEMP
  ldi TEMP, (1<<ADEN) | (1<<ADPS2) | (1<<ADPS1) | (1<<ADPS0)
  sts ADCSRA, TEMP
  ret

; Obtengo una muestra del ADC
READ_ADC:
  lds TEMP, ADMUX             ; Load current ADMUX value
  andi TEMP, 0xF0             ; Clear the channel selection bits (MUX4:0)
  ori TEMP, ADC_CHANNEL       ; Set the desired channel
  sts ADMUX, TEMP

  lds TEMP, ADCSRA
  ori TEMP, (1 << ADSC)       ; Start conversion
  sts ADCSRA, TEMP
WAIT_FOR_CONVERSION:
  lds TEMP, ADCSRA
  sbrs TEMP, ADSC             ; Skip if ADSC bit is cleared (conversion complete)
  rjmp WAIT_FOR_CONVERSION

  lds adc_low, ADCL           ; Read ADC low byte
  ret
