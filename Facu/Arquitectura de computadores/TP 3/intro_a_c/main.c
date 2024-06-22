/*
 * intro_a_c.c
 *
 * Created: 13/6/2024 16:44:09
 * Author : Tomas Vidal
 */ 

#include <stdint.h>
#include <stdio.h>
#define F_CPU 16000000UL
#include <avr/io.h>
#include "util/delay.h"
#include "UART.h"

extern void INIT_ADC(void);
extern void READ_ADC(void);
volatile uint8_t adc_low;

//String[] es un vector, pero el compilador cuando le ponemos texto
//lo trata como un String y automáticamente pone la terminación NULL al final
char String[]="Hola mundo!!";

int main(void) {
  USART_init(); //Llama la rutina de inicialización de la USART
  INIT_ADC();
  while (1) {
    READ_ADC();
    sprintf(String, "%x", adc_low);
    USART_putstring(String); //envía el string por el puerto serie
    _delay_ms(5000); //retardo de 5 segundos
  }
  return 0;
}
