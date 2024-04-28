/ Proyecto Integrador. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomás Vidal (69854/4)
/ Algoritmo utilizado: Bubble sort
/ Ocupación de memoria de programa: ...
/ Ocupación de memoria de datos (sin incluir el vector): ...
/ Performance
/ Vector ordenado -3,-2,-1,0,1,2,3 : ... instrucciones
/ Vector invertido 3,2,1,0,-1,-2,-3 : ... instrucciones
/ Vector desordenado 0,-2,1,3,-1,2,-3 : ... instrucciones

/ El algoritmo es muy sencillo, simplemente veo si el numero actual es menor o mayor que 
/ el siguiente y en base a eso los intercambio de posición o no. Por esto  es que solamente
/ require un espacio extra de memoria, ya que necesito un lugar donde almacenar temporalemente
/ los datos.

/ Comienza el programa
ORG 100

Jump ordenar

/ Asignación de los valores de prueba para el vector de datos

/ Algoritmo de ordenamiento

/ Constantes
DataLengthPtr,    HEX 0001
DataPtr,          HEX 0002
Temp,             DEC 0
