## Filmina 01 (Memorias)
### Diferencias entre ISA, organización y tecnología
El ISA son las instrucciones, mientras que la organización son como se procesan esas instrucciones en ciclos de reloj (es decir, se usan buses compartidos o se usa maquina de estados, etc), y por último la tecnología es lo que se usa para hacer la implementación, tecnología de 10nm o de 4nm, que tan rápido pueden conmutar los circuitos, etc.
En esencia una misma ISA puede ser implementada con diferentes organizaciones y/o tecnologías. Lo cual daría resultado a diferentes *performances*.
Arquitectura = "Como deberian organizarse las cosas dentro del procesador" (organización = arquitectura)

### Von Neumann vs Hardvard
Von Neumann tiene la memoria de datos e instrucciones juntas. En cambio la de Hardvard las tiene separadas. Hardvard tiene más sentido y aplicación en dispositivos DSP, en cambio en las computadoras actuales se usa Von Neumann

### Memorias
En vez de acceder a cada bit individualmente se accede por bloques. En vez de tener conexiones para las entradas y las salidas, se hacen conexiones de habilitación para escritura y lectura que se acceden con un mux que permite simplificar la cantidad de conexiones con una relación logarítmica:
![[Arquitectura 2024 Clase 01 - Modelo y Memorias.pdf#page=35&rect=501,121,673,292|Arquitectura 2024 Clase 01 - Modelo y Memorias, p.35]]

# Clase 02 ? Buses y ciclos de instrucciones

## Clase 03
![[Arquitectura 2024 Clase 03 - Lenguaje Ensamblador.pdf#page=6&rect=210,163,471,263|Arquitectura 2024 Clase 03 - Lenguaje Ensamblador, p.6]]

## Clase 04 (Mejoras ISA, parte 1)
![[Pasted image 20240523112837.png]]

## Clase 05 (Mejoras ISA, parte 2)
- Pilas
- Big-endian / little-endian
- Port mapped I/O (un espacio para IO y otro para datos). Memory mapped (IO y datos en un espacio contiguo)


## Clase 06?

## Clase 07
Calculo de potencia: $P=fCV^2$

## Clase 08
Se usa para medir el performance el Spedup $S=\frac{T_a}{T_b}$

## Clase 09
# Hay cosas para estudiar (calculo de energía)