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
.set MASK = 0x3F ; esta mascara es para hacer mas random el numero
.set LED_PIN = PB5

.def TEMP = r16
.def adc_low = r17
.def Counter = r18
.def I = r19
.def J = r20
.def currVal = r21
.def nextVal = r22

; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  MACROS - - - - -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; macro para cargar valor
; a registro de IO
.macro lior
  ldi TEMP, @1
  out @0, TEMP
.endmacro

.macro LDX
ldi r26, LOW(@0)
ldi r27, HIGH(@0)
.endmacro
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  SETUP  -  -  -  -  -  -  -  - 
; -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  - 
.org 0x0000 rjmp RESET

.dseg
.org VEC_START_ADDR
VECT: .byte VEC_LEN

.cseg
RESET:
  ; inicializo el Stack Pointer
  lior SPL, LOW(RAMEND)
  lior SPH, HIGH(RAMEND)

  sbi DDRB, LED_PIN ; seteo el pin 3 como salida

  rcall INIT_ADC

  rcall CREATE_RND_VECT
  rjmp MAIN_LOOP
  rcall BUBBLE_SORT
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
  sbi PORTB, LED_PIN ; seteo el pin a alto

  ldi Counter, VEC_LEN
  ldx VEC_START_ADDR

push_element:
  ; empujar un nuevo valor al vector
  rcall READ_ADC
  st X+, adc_low

  ; continuar iterando si no se llego a completar el vector
  dec Counter
  brne push_element

  cbi PORTB, LED_PIN ; seteo el pin a bajo
  ret

INIT_ADC:
  ldi TEMP, (1<<REFS0)
  sts ADMUX, TEMP
  ldi TEMP, (1<<ADEN) | (1<<ADPS2) | (1<<ADPS1) | (1<<ADPS0)
  sts ADCSRA, TEMP
  ret

; Obtengo una muestra del ADC
READ_ADC:
  ; se prepara el ADC para la conversion
  lds TEMP, ADMUX
  andi TEMP, 0xF0
  ori TEMP, ADC_CHANNEL
  sts ADMUX, TEMP

  ; se comienza la conversion
  lds TEMP, ADCSRA
  ori TEMP, (1 << ADSC)
  sts ADCSRA, TEMP
WAIT_FOR_CONVERSION:
  lds TEMP, ADCSRA
  sbrs TEMP, ADSC
  rjmp WAIT_FOR_CONVERSION ; se espera hasta que el bit de terminado sea cero

  lds adc_low, ADCL
  andi adc_low, MASK ; se aplica una mascara para hacer mas aleatorio el resultado
  ret

; este es el entry point del algoritmo
; de Bubble Sort
BUBBLE_SORT:
  sbi PORTB, LED_PIN ; seteo el pin a alto

  ; i=0
  ldi I, 0

loop_i:
  ; i < n ?
  cpi I, VEC_LEN
  brlt sort_ended ; si i >= VEC_LEN terminar

  ; j=0
  ldi J, 0

loop_j:
  ; j < n - i - 1 ?
  ldi TEMP, VEC_LEN
  sub TEMP, I
  dec TEMP
  cp J, TEMP
  brlt increment_i

  ldx VEC_START_ADDR ; cargo la direccion inicial del vector de datos
  add XL, J

  ; cargo el valor actual y el siguiente
  ; a[j] y a[j+1]
  ld currVal, X
  adiw XL, 1
  ld nextVal, X
  sbiw XL, 1

  ; a[j] > a[j+1] ?
  cp currVal, nextVal
  brlt increment_j

  ; intercambiar a[j] y a[j+1]
  mov TEMP, currVal
  st X, nextVal
  adiw XL, 1
  st X, TEMP
  sbiw XL, 1

increment_j:
  ; incrementar J
  inc J
  rjmp loop_j

increment_i:
  inc I
  rjmp loop_i

sort_ended:
  cbi PORTB, LED_PIN ; seteo el pin a bajo
  ret
