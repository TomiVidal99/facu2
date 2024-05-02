/ Problema 1. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ Mi algoritmo simplemente suma de a 7, 10 veces y
/ almacena el resultado en las direcciones 80, 81, 82, ..., 90
/ de manera creciente en valor y direccion de memoria

/ A estas alturas ya todos sabemos programar
/ Entonces voy a usar pseudocódigo para explicar
/ que hace el programa, en vez de usar oraciones que
/ pueden ser medias ambigüas

/ (NOTA)
/ Uso CurrVal para almacenar temporalmente el Valor(Index)+7
/ CurrVal = CurrentValue = Valor Actual

ORG 100 / offset de memoria

/ Comienzo Algoritmo

/ Valor[Index] = 7 (sería como la condición inicial)
/ ----------------
Add Seven
StoreI Index
/ ----------------

/ do-while loop, la condición está al final
/ ----------------

        / CurrVal = Valor[Index]
        / print(CurrVal)
        / (tuve que ponerlo así feo porque la etiqueta
        / no permite comentarios en la misma linea)
        / ----------------
Loop,   LoadI Index
        Store CurrVal
        Output
        / ----------------

        / Index++
        / ----------------
        Load Index
        Add One
        Store Index
        / ----------------

        / Valor[Index] = 7 + Valor[Index-1]
        / ----------------
        Load CurrVal
        Add Seven
        StoreI Index
        / ----------------

        / while (Index !== EndAddr)
        / ----------------
        Load Index
        Subt EndAddr
        Skipcond 400
        Jump Loop
        / ----------------

/ ----------------

Halt

/ Constantes
CurrVal,    DEC 7
Index,      DEC 80
EndAddr,    DEC 90
One,        DEC 1
Seven,      DEC 7
