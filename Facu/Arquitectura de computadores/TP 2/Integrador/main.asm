;
; proyecto_integrador_tp2.asm
;
; Created: 31/5/2024 10:19:48
; Author : Tomás Vidal
;
; Implemento el algoritmo de bubble sort
; La obtencion de numeros aleatorios se hace
; haciendo lecturas del ADC

.include "m328Pdef.inc"
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   
; -  -  -  -  -  -  -  Constantes - - - - -  -  -  -  -  -  -- 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -   
.def ZERO = r1
.def TEMP = r18
.def Counter = r19
.def I = r20
.def J = r21
.def currVal = r22
.def nextVal = r23

.equ VECT_LEN = 255
.equ VECT_START_MEM = 0x0100
.equ ADC_CHANNEL = PD0
.equ LED_PIN = PB5
.equ TIME_AVG_MAX_COUNTS = 20

.dseg
.org VECT_START_MEM
VECT: .byte VECT_LEN

.cseg
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  MACROS - - - - -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; macro para cargar valor
; a registro de IO
.macro lior
  ldi TEMP, @1
  out @0, TEMP
.endmacro

.macro ldx
  ;.if @0 == X ?
  ldi XL, LOW(@0)
  ldi XH, HIGH(@0)
.endmacro

.macro ldy
  ldi YL, LOW(@0)
  ldi YH, HIGH(@0)
.endmacro


; Inicializo el ADC
.macro INIT_ADC
  ; @0 es un registro temporal
  ldi @0, (1<<ADEN) | (1<<ADPS2) | (1<<ADPS1) | (1<<ADPS0) ; habilito el ADC y selecciono el prescaler
  sts ADCSRA, @0
  ldi @0, (1<<REFS0) ; seteo la referencia
  sts ADMUX, TEMP
.endmacro

; Pone el LED_PIN en salida
.macro SETUP_LED
  sbi DDRB, PB5
.endmacro

; prendo el LED del pin 13 como indicador de que comenzo el contador
.macro LED_HIGH
  sbi PORTB, LED_PIN
.endmacro

; apago el LED indicador
.macro LED_LOW
  cbi PORTB, LED_PIN
.endmacro

; set AND in data space
; es para setear un inmediato en el espacio de datos
.macro SORDS
  ; @0 es el registro que se va a modificar
  ; @1 es el inmediato que se va a hacer AND con
  lds TEMP, @0
  ori TEMP, @1
  sts ADCSRA, TEMP
.endmacro

.macro SANDDS
  ; @0 es el registro que se va a modificar
  ; @1 es el inmediato que se va a hacer OR con
  lds TEMP, @0
  andi TEMP, @1
  sts ADCSRA, TEMP
.endmacro

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  SETUP  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 

.org 0x0000 rjmp RESET
RESET:
  ; Cargo cero en un registro, es para hacer operaciones con carry
  clr ZERO

  ; Inicializo el Stack Pointer
  lior SPL, LOW(RAMEND)
  lior SPH, HIGH(RAMEND)

  ; Configuro el LED
  SETUP_LED

  ; Inicializo el ADC
  INIT_ADC TEMP

  call TIME_AVG_BUBBLE_SORT

  rjmp MAIN_LOOP

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  LOOP PRINCIPAL  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
MAIN_LOOP:
  rjmp MAIN_LOOP

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  FUNCIONES  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; Uso el vector X como puntero al dato iesimo
; Uso el vector Y como contador, ya que VECT_LEN > 255
LOAD_RND_VECTOR:
  ldx VECT_START_MEM
  ldy VECT_LEN
lrv_loop:

  rcall READ_ADC ; Cargo la parte baja de la lectura del ADC 0 en TEMP
  ;mov TEMP, YL ; use esto para debugear

  st X+, TEMP ; VECT[X*] = TEMP

  sbiw Y, 1 ; Y--
  brne lrv_loop

  ret

; Este es el entry point del algoritmo
; de Bubble Sort
; Registros usados:
; I - contador del loop exterior
; J - contador del loop interior
; TEMP - temporal
; currVal - valor actual del vector
; nextVal - valor siguiente del vector
BUBBLE_SORT:
  ; i=0, j=0
  clr I
  clr J
start_i_loop:
  ; i < n ?
  ; si -> ir a (j<n-i-1?)
  ; no -> terminar bucle
  cpi I, VECT_LEN
  brsh end_sorted

  ; j=0
  clr J

  ; j < n-i-1 ?
  ; si -> ver si permutar datos
  ; no -> i++
after_start_i_loop:
  ldi TEMP, (VECT_LEN-1)
  cp J, TEMP
  brsh increment_i

  ; Cargo el puntero  actual
  ldx VECT_START_MEM
  add XL, J
  adc XH, ZERO

  ; currVal = a[j]
  ; nextVal = a[j+1]
  ld currVal, X+
  ld nextVal, X

  ; a[j] > a[j+1] ?
  ; si -> permutar
  ; no -> j++
  cp currVal, nextVal
  brlo increment_j
  breq increment_j

  ; Se permutan los datos
  st X, currVal
  st -X, nextVal

  ; j++
increment_j:
  sbiw X, 1 ; aca decremento X porque de antes me habia quedado avanzado en 1
  inc J
  rjmp after_start_i_loop

  ; i++
increment_i:
  inc I
  rjmp start_i_loop

end_sorted:
  ret

READ_ADC:
  ; Se comienza la conversion/lectura
  SORDS ADMUX, (1 << MUX0)
  SORDS ADCSRA, (1 << ADSC)
wait_for_conversion:
  lds TEMP, ADCSRA
  sbrc TEMP, ADIF
  rjmp wait_for_conversion ; se espera hasta que ADSC sea cero

  SORDS ADCSRA, (1 << ADIF) ; limpio ADIF para la siguiente conversion

  ldi TEMP, ADCL ; guardo el resultado en el registro temporal

  ret

TIME_AVG_BUBBLE_SORT:
  LED_HIGH
  ldi Counter, TIME_AVG_MAX_COUNTS
tavbs_loop:

  rcall LOAD_RND_VECTOR
  rcall BUBBLE_SORT

  dec Counter
  brne tavbs_loop

  LED_LOW
  ret
