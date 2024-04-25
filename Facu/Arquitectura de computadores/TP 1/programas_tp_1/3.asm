/ Problema 3. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ Mi algoritmo simplemente hace la diferencia entre el caracter y CR,
/ si la diferencia es cero entonces ese es el caracter CR y debo terminar el loop
/ Por lo tanto la longitud de cadena de texto calculada al final no tiene en cuenta el CR
/ (que es como funciona comúnmente)

/ La información la presenté de dos formas diferentes:
/ Primero en el simulador de marie.js ponga el formato de UNICODE
/ y verá como se imprime en pantalla la cadena de texto leída desde la memoria
/ y luego ponga el modo DEC y el último número que se imprime corresponde al tamaño de 
/ la cadena de texto.
/ Iba a hacer que se imprima todo en ASCII, pero era ya demasiado complejo para el problema resuelto.

/ Comienza el programa
ORG 03E

Loop,   LoadI StrPointer

        / print(Value(StrPointer))
        Output

        / if (CurrChar == CR) terminar
        Subt CR
        Skipcond 400
        Jump IncrementPointer


        / Se muestra la cantidad de caracteres que tiene la cadena de texto
        Load ASCII_SPACE
        /Output
        Load ASCII_LPARENT
        /Output
        Load Counter
        /Add ASCII_NUMBERS
        Output
        Load ASCII_RPARENT
        /Output

        Halt

        / StrPointer++
IncrementPointer,   Load StrPointer
                    Add One
                    Store StrPointer

                    / Counter++
                    Load Counter
                    Add One
                    Store Counter

                    Jump Loop

/ Constantes
MyString,           DEC 72    / 'H'
                    DEC 111   / 'o'
                    DEC 108   / 'l'
                    DEC 97    / 'a'
                    DEC 32    / ' '
                    DEC 112   / 'p'
                    DEC 114   / 'r'
                    DEC 111   / 'o'
                    DEC 102   / 'f'
                    DEC 101   / 'e'
                    DEC 115   / 's'
                    DEC 32    / ' '
                    DEC 100   / 'd'
                    DEC 101   / 'e'
                    DEC 32    / ' '
                    DEC 97    / 'a'
                    DEC 114   / 'r'
                    DEC 113   / 'q'
                    DEC 117   / 'u'
                    DEC 105   / 'i'
                    DEC 116   / 't'
                    DEC 101   / 'e'
                    DEC 99    / 'c'
                    DEC 116   / 't'
                    DEC 117   / 'u'
                    DEC 114   / 'r'
                    DEC 97    / 'a'
                    DEC 13    / Carriage return (CR)
DataLengthPtr,      HEX 50    / Puntero al tamaño del vector de datos
Counter,            DEC 0
One,                DEC 1
