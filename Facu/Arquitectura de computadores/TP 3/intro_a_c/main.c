/*
 * intro_a_c.c
 *
 * Created: 13/6/2024 16:44:09
 * Author : Tomas Vidal
 */ 

#define F_CPU 16000000UL
#include <avr/io.h>
#include "util/delay.h"
#include "UART.h"

//String[] es un vector, pero el compilador cuando le ponemos texto
//lo trata como un String y automáticamente pone la terminación NULL al final
char String[]="Hola mundo!!";

int main(void) {
	USART_init(); //Llama la rutina de inicialización de la USART
	while (1) {
		USART_putstring(String); //envía el string por el puerto serie
		_delay_ms(5000); //retardo de 5 segundos
	}
	return 0;
}
