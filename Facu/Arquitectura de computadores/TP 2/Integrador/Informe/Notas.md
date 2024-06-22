
# algoritmo
se implementó el mismo algoritmo de ordenamiento que en el Trabajo N°1, el algoritmo de Bubble Sort. La diferencia es que ahora se disponen de múltiples registros para almacenar datos temporalmente, por lo que se usaron dos registros para almacenar el dato actual y el dato siguiente del vector (a[j] y a[j+1]).  Además se usó un registro temporal para hacer calculo sobre las condiciones en el algoritmo. Luego para hacer los direccionamientos de memoria se usó el registro X (que son dos registros de 8 bits r27:r26), este registro de 16 bits es un puntero al dato en memoria

El codigo consiste basicamente de 3 funciones: 
1. La funcion que llena el vector con datos aleatorios (estos son lecturas del ADC que no está conectado a nada)
2. El algoritmo que itera sobre los valores del vector ordenandolos de menor a mayor (sin signo)
3. Un bucle que repite la llamada de la 1ra función y la segunda, en ese orden, una cantidad N de veces, de tal manera que se pueda promediar el tiempo que lleva realizar estas dos tareas
Para poder medir el tiempo que tarda en total la 3ra función, al comienzo de la misma se pone en alto (+5V) el pin 13 de la placa de desarrollo (PB5 en el PORTB, que es el pin del LED integrado de la placa), y una vez finalizado el bucle de N veces se pone en bajo (0V) el pin del LED.

## Mediciones en Simulacion de Proteus
Da un valor de aproximadamente 1.64 segundos totales, que resultan en 82ms ambas funciones



(Mostrar diagrama de flujo)




## Numeros aleatorios
Para obtener numeros aleatorios se empleó una lectura del ADC, cuyo pin de medición no está conectado a nada, por lo tanto la medición es aleatoria