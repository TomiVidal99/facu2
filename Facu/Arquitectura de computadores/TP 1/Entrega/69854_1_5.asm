/ Problema 5. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ Se implementa la multiplicación de dos números: num = x*y
/ se agrega 'x' a 'num' 'y' veces
/ Por lo tanto para mayor eficiencia se debería buscar que se introduzca
/ primero el numero más grande, es decir x>y para que sea más eficiente,
/ por lo que para mejorar el programa se podría verificar esto y permutar
/ x e y para que siempre se cumpla
/ (uso XPtr, YPtr y NumPtr, porque serían punteros, direcciones fijas de memoria)

/ Comienza el programa
ORG 100
/ Seteo de condiciones iniciales. Por si se quiere reinciar el programa
/ *XPtr = 0
/ *YPtr = 0
/ *NumPtr = 0
Load    Zero
StoreI  XPtr
StoreI  YPtr
StoreI  NumPtr

Jump    Multiply

/ subrutina de multiplicar
/ se le piden dos numeros al usuario
/ y se suma a uno el otro veces
Multiply, Input
          StoreI  XPtr
          Input
          StoreI  YPtr
          Jump    Loop


          / este loop es un do-while
          / *NumPtr += *NumPtr;
Loop,     LoadI   NumPtr
          AddI    XPtr
          StoreI  NumPtr

          / *YPtr--;
          LoadI   YPtr
          Subt    One
          StoreI  YPtr

          / aca está la condición del do while, sería el while (*YPtr != 0)
          / if (*YPtr == 0) {return};
          Skipcond  400 
          Jump      Loop

/ print(*NumPtr)
LoadI   NumPtr
Output

Halt

/ Constantes
XPtr,   HEX 10
YPtr,   HEX 11
NumPtr, HEX 12
One,    DEC 1
Zero,   DEC 0
