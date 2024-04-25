/ Problema 3. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ ??????????????????????????????

/ Comienza el programa
ORG 100

          / *CurrDataPtr++
          / avanzo a la siguiente posición de memoria del vector de datos
Loop,     Load CurrDataPtr
          Add One
          Store CurrDataPtr

          / if (number < 0)
          / Counter++
          LoadI CurrDataPtr
          Skipcond 800
          Jump IncrementCounter

          / Index++
ReturnIncrementCounter, Load Index
          Add  One
          Store Index

          / do-while (Index < DataLength)
          Subt DataLength
          Skipcond 400
          Jump Loop

Load Counter
Output

Halt

IncrementCounter, Load  Counter
                  Add   One
                  Store Counter
                  Jump ReturnIncrementCounter


/ Constantes
DataLength,         DEC 5  / Puntero al tamaño del vector de datos (esto ya estaría seteado en memoria)
Data,               DEC 1  / este es el vector de datos (ya estaría seteado en memoria)
                    DEC -1
                    DEC -10
                    DEC 8
                    DEC 20
CurrDataPtr,        DEC 276  / Puntero al dato actual del vector
One,                DEC 1
Counter,            DEC 0
Index,              DEC 0
