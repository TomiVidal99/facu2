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