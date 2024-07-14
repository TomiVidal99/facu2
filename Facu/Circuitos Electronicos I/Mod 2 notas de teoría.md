### Leer Libros:
- Millman para respuesta en frecuencia
- Meyer en general
## Comportamiento en alta frecuencia del BJT (modelo)
![[08 Comportamiento Transitorio y Respuesta en Frecuencia.pdf#page=12&rect=389,44,710,225|08 Comportamiento Transitorio y Respuesta en Frecuencia, p.12]]
Esos son todos los parámetros que se podrían representar, por lo general se desprecian los tachados quedando así un modelo más limpio:
![[08 Comportamiento Transitorio y Respuesta en Frecuencia.pdf#page=13&rect=279,68,718,305|08 Comportamiento Transitorio y Respuesta en Frecuencia, p.13]]

## Respuesta en alta frecuencia del MOS (modelo)
![[08 Comportamiento Transitorio y Respuesta en Frecuencia.pdf#page=22&rect=44,244,287,385|08 Comportamiento Transitorio y Respuesta en Frecuencia, p.22]]
Generalmente se desprecia $C_{ds}$ ya que queda enmascarada en la capacidad de la carga o es despreciable
Por lo que se usa el siguiente modelo: (similar al BJT pero sin $r_{\pi}$)
![[08 Comportamiento Transitorio y Respuesta en Frecuencia.pdf#page=22&rect=19,40,267,223|08 Comportamiento Transitorio y Respuesta en Frecuencia, p.22]]

## Comportamiento Transitorio y Respuesta en Frecuencia de Amplificadores

![[08 Comportamiento Transitorio y Respuesta en Frecuencia.pdf#page=25&rect=25,72,553,502|08 Comportamiento Transitorio y Respuesta en Frecuencia, p.25]]

## Tiempo de subida
![[08 Comportamiento Transitorio y Respuesta en Frecuencia.pdf#page=33&rect=328,42,490,105|08 Comportamiento Transitorio y Respuesta en Frecuencia, p.33]]

### Respuesta si se aplica un tren de pulsos
La idea es que el sistema tiene que responder más rapido que la frecuencia a la que se envían los pulsos, y eso se verifica con las siguientes condiciones:
![[08 Comportamiento Transitorio y Respuesta en Frecuencia.pdf#page=34&rect=11,40,693,323|08 Comportamiento Transitorio y Respuesta en Frecuencia, p.34]]

# Importante: llama $f_{T}$ a la frecuencia que corta 0 dB
Como para un sistema de orden 1 en ancho de banda es la frecuencia de corte, se puede calcular el producto gananacia por ancho de banda:
### Se puede obtener $C_{\mu}$
![[09 Respuesta en Frecuencia.pdf#page=4&rect=377,107,587,171|09 Respuesta en Frecuencia, p.4]]

### Se hace un análisis de la respuesta en frecuencia teniendo en cuenta los parametros de alta frecuencia, para todas las configuraciones del BJT
La idea principal es que a partir de un análisis simplificado, se puede aproximar la respuesta de orden 2 del modelo del BJT EC a una de orden 1. Y a partir de estos valores se pueden obtener la del resto de configuraciones BC y CC.
![[09 Respuesta en Frecuencia.pdf#page=9&rect=3,43,701,530|09 Respuesta en Frecuencia, p.9]]
También es importante que se usa $f_{t}$ para hacer los cálculos, ya que es un parámetro bastante constante en los diferentes BJTs (es un dato que provee el fabricante)

### Etapas de amplificación en cascada
Aparece un efecto de carga que es facil de razonar pensando que el producto A.BW se tiene que conservar. Por lo que si se aumenta A tiene que disminuir BW.![[09 Respuesta en Frecuencia.pdf#page=26&rect=19,42,709,512|09 Respuesta en Frecuencia, p.26]]
![[09 Respuesta en Frecuencia.pdf#page=27&rect=39,121,249,187|09 Respuesta en Frecuencia, p.27]]
Para n etapas identicas conectadas en cascada
### Método de las Constantes de Tiempo.
Por un lado está el efecto de carga (resistivo) conocido, pero eso no es problema. El mayor problema para el cálculo es la presencia de los capacitores Cμ que conectan las salidas con las entradas, cuyo efecto ya hemos visto según el enfoque de Miller. Las aproximaciones realizadas para la etapa EC simple pueden no ser válidas por la carga capacitiva que representa la etapa siguiente
Es un enfoque sistemático para el cálculo de los polos de amplificadores RC, que utilizaremos para calcular la respuesta a altas frecuencias y en particular el polo dominante. Recordemos algunos aspectos vinculados al concepto de polo dominante de la respuesta en alta frecuencia de un amplificador multietapa.
![[09 Respuesta en Frecuencia.pdf#page=29&rect=13,47,705,508|09 Respuesta en Frecuencia, p.29]]

![[09 Respuesta en Frecuencia.pdf#page=30&rect=28,186,632,449|09 Respuesta en Frecuencia, p.30]]


# Método de las constantes de tiempo
![[09 Respuesta en Frecuencia.pdf#page=31&rect=14,45,703,503|09 Respuesta en Frecuencia, p.31]]

![[09 Respuesta en Frecuencia.pdf#page=32&rect=19,47,704,498|09 Respuesta en Frecuencia, p.32]]

### Respuesta en frecuencia de sistemas realimentados
![[09 Respuesta en Frecuencia.pdf#page=52&rect=7,50,698,526|09 Respuesta en Frecuencia, p.52]]

Es importante observar que saca una nueva ganancia de lazo directo $A(s)$ que es función de la frecuencia. Y entonces con esa nueva ganancia de lazo directo hace la ganancia de lazo cerrado (realimentación) $A_{r}(s)$

El polo sin realimentar se desplaza hacia una frecuencia más alta cuando se cierra el lazo (tiene sentido ya que el producto A.BW se tiene que conservar y la ganancia de lazo cerrado siempre es menor que la de lazo directo)
![[09 Respuesta en Frecuencia.pdf#page=53&rect=372,215,636,412|09 Respuesta en Frecuencia, p.53]]

![[09 Respuesta en Frecuencia.pdf#page=53&rect=21,47,180,75|09 Respuesta en Frecuencia, p.53]]

### También hay una relación para cuando el sistema es de orden 2 (osea dos polos), pero es "muy compleja" no creo que la tomen

## Es importante hacer un análisis de los polos, porque el realimentar un orden dos puede hacer que se haga inestable y oscile



# TP 6 (último) lo separo para que no sea tanto en una sola nota
[[Mod 2 notas teoría 2 (TP 6)]]
