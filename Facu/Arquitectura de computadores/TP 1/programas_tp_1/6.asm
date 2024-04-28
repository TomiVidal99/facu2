/ Problema 6. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ Implemento el factorial haciendo un bucle que aprovecha a YPtr
/ como contador para ir sumando en RsltPtr el producto de XPtr e YPtr
/ empleo una variable temporal que uso como iterador en el bucle de la 
/ multiplicación ("interna")
/ 
/ CONSIDERE: el máximo factorial que se puede calcular es 7
/ ya que al ser un dato de 16 bits en complemento a dos, el máximo numero
/ es 32767. Y el factorial de 8 es 40320 que se va de la representación.

/ Comienza el programa
ORG 100
/ Seteo de condiciones iniciales. Por si se quiere reinciar el programa
/ *XPtr = 0
/ *YPtr = 0
/ Temp = 0
Load    Zero
StoreI  XPtr
StoreI  YPtr
Store   Temp

/ *RsltPtr = 1
/ porque el factorial de cero es 1
Load    One
StoreI  RsltPtr

/ if (Input(User) <= 0) {exit};
Input
Skipcond 800
Jump Terminate

/ *YPtr = Input(User);
StoreI  YPtr

Jump    Factorial

/ Subrutina de factorial
Factorial,  LoadI   RsltPtr
            StoreI  XPtr / *XPtr = *RsltPtr;

            LoadI   YPtr
            Subt    One / *YPtr--;
            StoreI  YPtr
            Store   Temp / Temp = *YPtr; Variable temporal que almacena la iteración de la multiplicación

            / if (*YPtr > 0) {exit};
            / else *XPtr = !(*XPtr);
            Skipcond 400
            Jump    Multiply / *RsltPtr = *XPtr * *YPtr;
            Jump    Terminate

          / este loop es un do-while
          / *RsltPtr += *RsltPtr;
Multiply, LoadI   RsltPtr
          AddI    XPtr
          StoreI  RsltPtr

          / Temp--;
          Load    Temp
          Subt    One
          Store   Temp

          / aca está la condición del do while, sería el while (Temp != 0)
          / if (Temp == 0) {return};
          Skipcond  400 
          Jump      Multiply


          Jump      Factorial


/ Terminar programa
              / print(*RsltPtr)
Terminate,    LoadI   RsltPtr
              Output
              Halt

/ Constantes
XPtr,   HEX 10
YPtr,   HEX 11
RsltPtr, HEX 12
One,    DEC 1
Zero,   DEC 0
Fact,   DEC 0
Temp,   DEC 0
