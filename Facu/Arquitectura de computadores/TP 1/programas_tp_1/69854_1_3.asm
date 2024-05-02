/ Problema 3. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ El programa simplemente itera sobre el vector comparando si el numero es
/ Ni<0 y si se cumple suma uno a un contador, al finalizar imprime el contador

/ Comienza el programa
ORG 100

/ Esto lo hago para no tener que estar accediendo
/ indirectamente al dato, además la aprovecho para indexar el vector
/ la substracción la hago para comparar si es menor
LoadI DataLengthPtr
Store DataLength

/ if (DataLength <= 0) {exit}
Skipcond 800
Jump Terminate

/ Condiciones iniciales, limpio la memoria, por si se quiere correr varias veces el codigo
Load DataLengthPtr
Store CurrDataPtr
Load Zero
Store Counter

          / *CurrDataPtr++
          / avanzo a la siguiente posición de memoria del vector de datos
Loop,     Load CurrDataPtr
          Add One
          Store CurrDataPtr

          / if (number < 0)
          / Counter++
          LoadI CurrDataPtr
          Add One
          Skipcond 800
          Jump IncrementCounter

          / DataLength--
ReturnIncrementCounter, Load DataLength
          Subt One
          Store DataLength

          / do-while (DataLength > 0)
          Skipcond 400
          Jump Loop

Terminate, Load Counter
Output
Halt

IncrementCounter, Load  Counter
                  Add   One
                  Store Counter
                  Jump ReturnIncrementCounter


/ Constantes
DataLengthPtr,      HEX 0010  / Puntero al tamaño del vector de datos (esto ya estaría seteado en memoria)
CurrDataPtr,        HEX 0010  / Puntero al dato actual del vector, el loop comienza sumandole 1
One,                DEC 1
Zero,               DEC 0
Counter,            DEC 0
DataLength,         DEC 0
