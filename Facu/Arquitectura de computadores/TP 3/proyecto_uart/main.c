#include <atmel_start.h>
#include <stdio.h>
#define MY_DELAY for(unsigned long int i = 0; i <5000000; i ++);
int main(void)
{
	/* Inicializa MCU, controladores y middleware */
	atmel_start_init();
	/* Reemplazar con el código de su aplicación */
	while(1){
		printf("Testeando 123 \n \r");
		MY_DELAY;
	}
}