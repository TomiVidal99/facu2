# Cosas para preguntar
- pipeline saltos condicionales
### Conceptos clave de la materia
- Comparación y comprensión general de arquitecturas
- Técnicas de implementación
- Medición de performance
- Recomendaciones generales de diseño

## Modelo de Von Neumann
![[Arquitectura 2024 Clase 01 - Modelo y Memorias.pdf#page=4&rect=131,149,539,342|Arquitectura 2024 Clase 01 - Modelo y Memorias, p.4]]
- Es la que domina
- Propone tener un mismo circuito aritmético lógico que interpreta una secuencia de instrucciones
- La secuencia de instrucciones pueden cambiar fácilmente (se puede resolver muchos problemas con las misma máquina). La secuencia de instrucciones almacenada se la llama **PROGRAMA**
#### Elementos principales del modelo
- Unidad central de procesamiento (CPU): 
	- Unidad de control **fetch-decode-execute** secuencial. 
	- datapath: ALU y registros de los datos  (y puede ser de los I/O tambien?)
- Memoria
- I/O
Propone un diseño básico de la máquina
![[Arquitectura 2024 Clase 01 - Modelo y Memorias.pdf#page=7&rect=47,91,390,333|Arquitectura 2024 Clase 01 - Modelo y Memorias, p.7]]

- En la unidad de memoria se almacena tanto el programa como los datos. (esa es la memoria de Von Neumann)
- Al recorrido que hacen los datos se le llama **datapath**

![[Arquitectura 2024 Clase 02 - Buses y el Ciclo de Instrucción.pdf#page=14&rect=10,37,712,395|Arquitectura 2024 Clase 02 - Buses y el Ciclo de Instrucción, p.14]]

## Ciclos de instrucciones
En general se sigue el esquema de FETCH-DECODE-EXECUTE. Es decir CAPTACIÓN-DECODIFICACIÓN-EJECUCIÓN
	Todas las instrucciones pasan por ese ciclo

### Medición de performance
![[Arquitectura 2024 Clase 03 - Lenguaje Ensamblador.pdf#page=7&rect=142,161,533,334|Arquitectura 2024 Clase 03 - Lenguaje Ensamblador, p.7]]
![[Arquitectura 2024 Clase 03 - Lenguaje Ensamblador.pdf#page=8&rect=23,12,708,336|Arquitectura 2024 Clase 03 - Lenguaje Ensamblador, p.8]]

## Ortogonalidad
Que las instrucciones puedan o no acceder a todos los modos de direccionamiento
Utilidad: Mayor versatilidad en el desarrollo. 
Problemas: A nivel de implementación es ineficiente (se usa poco y es más complejo)

## Stack y StackPointer
El stack permite hacer seguimiento de las posiciones cuando se hacen saltos de memoria
El StackPointer es un registro que guarda el puntero hacia la posición actual del Stack
Cuando no se tiene un Stack por hardware se puede hacer por software, pero la mayoría de los micros tienen Stack
Que requiere como mínimo el Stack:
- El registro de puntero (StackPointer)
- Zona de memoria
- Dos nuevas instrucciones: PUSH y POP

## Endianness
AVR: registros X, Y y Z

## Interrupciones
Tabla de vectores: registros que contienen las posiciones de memorias de los Event Handlers
La tabla de vectores son datos provistos por el fabricante, cada interrupcion tiene su propio valor en la tabla
(ejemplo: en la posicion 0 de la tabla de vectores está el RESET, entonces el RESET contiene una dirección al MAIN)

## Hardvard
Se tiene una memoria de datos y otra memoria para el programa (con esto no se podría ejecutar un dato como una instruccion)
- CPU mas compleja/costosa
- dos buses (datos y programa)
- acceso simultánea al codigo de instruccion y el operando

## Segmentación
Al proceso de captación-decodificación-ejecución (fetch-decode-execute) se lo puede pensar como un proceso que se puede ejecutar simultáneamente, por lo que se logra mayor procesamiento de instrucciones por unidad de tiempo. (las instrucciones toman lo mismo, pero ahora se ejecutan mas por tiempo)
Posible problema: que al tener instrucciones  que sean de diferentes dimensiones (en ciclos) haga que todo se retrase mucho más en vez de llevar menos

## Latencia vs productividad
La latencia puede ser por ejemplo de 3, es decir le lleva 3 ciclos de reloj completar la ejecución de una dada instrucción. Pero la productividad puede ser de 1, es decir por cada ciclo de reloj se completa 1 instrucción. (esto se debe al paralelismo o la segmentación, solo posible en Hardvard)

## Performance
### Speedup
Suponiendo que la máquina A es más rápida que B:
**SPEEDUP (MEJORA)** $S=\frac{T_A}{T_B}=\frac{n_B}{n_A}$, $S=1+\frac{m}{100}$
Se dice que A es m% más rápida que B
### Ley de Amdahl
Siendo T el tiempo de ejecución de una tarea y f la fracción de ese tiempo que puede mejorarse en un factor k, entonces la mejora total obtenida será
$S=\frac{1}{(1-f)+\frac{f}{k}}$ 
$S_{max}=\frac{1}{(1-f)}$
$S=\frac{T}{T_{mejorado}}$

## Benchmarks
Son metricas que caracterizan los procesadores (dicho mal y pronto)
## MIPS
Millones de instrucciones por segundo
$MIPS = \frac{N}{T_{CPU}.10^{6}} = \frac{f_{clock}}{CPI.10^{6}}$
### MFLOPS
Millones de instrucciones en punto flotante por segundo
$MFLOPS = \frac{N_{NP}}{T_{CPU}.10^{6}}$
#### MIPS y MFLOPS
Esto sirve si se comparan los mismos ISA, porque hay que pensar: "si son x instrucciones por segundo, pero, ¿qué hacen esas instrucciones?"

## Benchmarks sintéticos
Programas simples que comprueban el comportamiento ante un tipo de carga específica.
- Whetstone: punto flotante
- Linpack: algebra lineal
- Dhrystone: enteros, strings processing
- Coremark: integer multiplication

## Benchmarks sintéticos más usados
**DMIPS** = ( iteraciones Dhrystone ) / ( 1757 ), ¿porque 1757? porque es el Dhrystone que resulta de la primera máquina que hizo un MIPS (VAX-11), se usa esta máquina como un punto de referencia

DMIPS/MHz -> se independiza de la tecnología, es más una medida de la organización de la máquina

## Medición de consumo
DMIPS/MHz  * MHz/mWatt -> Figura de eficiencia de cómputo