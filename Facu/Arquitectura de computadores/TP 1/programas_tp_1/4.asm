/ Problema 4. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ Calculo el algoritmo dandole las condiciones inicales de 0 y 1, posteriormente a esto
/ hay un bucle (loop) que va asignado el siguiente valor en la posición de memoria correctamente
/ hasta llegar a la posición 0x0052 (osea 20 elementos)

/ Comienza el programa
ORG 100

/ Seteo de condiciones iniciales
Load One
StoreI CurrPtr

/ Ahora si comienza el algoritmo
/ basicamente calcula: Next = Curr + Prev
/ o matemáticamente:   a(i+1) = a(i) + a(i-1)
Loop,   LoadI PrevPtr / Temp = Value(*PrevPtr)
        Store Temp

        LoadI CurrPtr / *NextPtr = Value(*CurrPtr) + Temp
        Add Temp
        StoreI NextPtr

        / print(Value(*NextPtr))
        Output

        / NextPtr++
        Load NextPtr
        Add One
        Store NextPtr

        / CurrPtr++
        Load CurrPtr
        Add One
        Store CurrPtr

        / PrevPtr++
        Load PrevPtr
        Add One
        Store PrevPtr

        Load MaxCount
        Subt One
        Store MaxCount
        Skipcond 000
        Jump Loop


Zero,       DEC 0
One,        DEC 1
NextPtr,    HEX 0042
CurrPtr,    HEx 0041
PrevPtr,    HEX 0040
Temp,       DEC 0
MaxCount,   DEC 17
