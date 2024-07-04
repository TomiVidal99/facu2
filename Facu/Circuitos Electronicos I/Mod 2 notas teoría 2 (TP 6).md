### Topología general de un OP AMP (interior, con BJT o MOSFETS)
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=2&rect=7,47,709,534|10 Amplificadores Diferenciales Transistorizados, p.2]]

### BJT acoplador por emisor común (gran señal)
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=6&rect=29,65,309,151|10 Amplificadores Diferenciales Transistorizados, p.6]]

![[10 Amplificadores Diferenciales Transistorizados.pdf#page=7&rect=37,25,711,261|10 Amplificadores Diferenciales Transistorizados, p.7]]

una nota importante es que la región lineal tiene un ancho de $2V_{T}$, es decir que si nos movemos $V_{T}$ hacia la izquierda o la derecha salimos de la zona lineal (visto en el lab 4)

### Polarización (acoplamiento por emisor)
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=8&rect=5,45,344,227|10 Amplificadores Diferenciales Transistorizados, p.8]]

#### Con resistencia de emisor
Tener una resistencia en el emisor de la topología anterior hace que aumente la región de linealidad. Pero también ocurre que a mayor linealidad menor transconductancia (es obvio que va a ganar menos)
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=14&rect=11,47,691,524|10 Amplificadores Diferenciales Transistorizados, p.14]]

# Teorema de biseccion
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=24&rect=17,53,697,527|10 Amplificadores Diferenciales Transistorizados, p.24]]

![[10 Amplificadores Diferenciales Transistorizados.pdf#page=25&rect=21,43,711,527|10 Amplificadores Diferenciales Transistorizados, p.25]]

![[10 Amplificadores Diferenciales Transistorizados.pdf#page=26&rect=19,46,705,526|10 Amplificadores Diferenciales Transistorizados, p.26]]

![[10 Amplificadores Diferenciales Transistorizados.pdf#page=27&rect=51,242,683,451|10 Amplificadores Diferenciales Transistorizados, p.27]]

![[10 Amplificadores Diferenciales Transistorizados.pdf#page=28&rect=44,80,713,474|10 Amplificadores Diferenciales Transistorizados, p.28]]

## Polarización (modo común)
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=30&rect=45,46,707,489|10 Amplificadores Diferenciales Transistorizados, p.30]]

## Modo diferencial
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=32&rect=23,46,713,499|10 Amplificadores Diferenciales Transistorizados, p.32]]

## Respuesta en frecuencia
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=42&rect=11,58,711,533|10 Amplificadores Diferenciales Transistorizados, p.42]]

![[10 Amplificadores Diferenciales Transistorizados.pdf#page=43&rect=22,39,705,521|10 Amplificadores Diferenciales Transistorizados, p.43]]
El CMRR empieza a caer cuando empieza a ganar CM (tiene sentido)

## Buenas conclusiones
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=47&rect=1,43,719,539|10 Amplificadores Diferenciales Transistorizados, p.47]]


## Amplificadores desbalanceados (realidad)
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=52&rect=9,40,702,532|10 Amplificadores Diferenciales Transistorizados, p.52]]
Esto es lo que aparece en los integrados de los OP AMP, que tienen tensiones de offset para el ajuste
### Cálculo de tensiones de offset
![[10 Amplificadores Diferenciales Transistorizados.pdf#page=54&rect=16,102,705,529|10 Amplificadores Diferenciales Transistorizados, p.54]]

# Filminas 11 (último)
## Espejos de corriente
![[11 Electronica Integrada.pdf#page=12&rect=18,41,713,532|11 Electronica Integrada, p.12]]

![[11 Electronica Integrada.pdf#page=13&rect=32,56,707,525|11 Electronica Integrada, p.13]]
esto es lo del laboratorio

### Otra configuración del espejo de corrientes (con diff caracteristicas)
![[11 Electronica Integrada.pdf#page=14&rect=9,47,713,533|11 Electronica Integrada, p.14]]

## Espejos múltiples
![[11 Electronica Integrada.pdf#page=15&rect=11,45,707,524|11 Electronica Integrada, p.15]]


## Espejos de corrientes BJT y MOS
![[11 Electronica Integrada.pdf#page=17&rect=11,53,709,530|11 Electronica Integrada, p.17]]
acá se puede ver que hay una relación entre $I_{0}$  y $I_{ref}$, en relación con las áreas de los BJT, esto es aplicable en electrónica integrada porque hay más control sobre las especificaciones de diseño

![[11 Electronica Integrada.pdf#page=19&rect=27,53,695,529|11 Electronica Integrada, p.19]]
Mete una resistencia en el emisor. y después (más adelante) una en cada emisor:

![[11 Electronica Integrada.pdf#page=20&rect=10,52,711,524|11 Electronica Integrada, p.20]]

![[11 Electronica Integrada.pdf#page=21&rect=39,55,716,521|11 Electronica Integrada, p.21]]

![[11 Electronica Integrada.pdf#page=22&rect=16,67,711,533|11 Electronica Integrada, p.22]]

## CASCODEEEE
![[11 Electronica Integrada.pdf#page=24&rect=11,73,708,524|11 Electronica Integrada, p.24]]

## Carga activa
Truquito para aumentar la ganancia
![[11 Electronica Integrada.pdf#page=25&rect=29,116,668,522|11 Electronica Integrada, p.25]]
## Aplicaciones de los amplificadores diferenciales en microelectrónica
falta un resumen de esto, pero simplemente son diferentes amplificadores como el LM741, a los que se les hace un análisis de la topología con los conocimientos de las fuentes de corrientes y amplis diff que se vieron en la teoría
Creo que la idea última se que con todo lo aprendido seamos capaces de leer un esquemático y saber reconocer las diferentes etapas y sus características.