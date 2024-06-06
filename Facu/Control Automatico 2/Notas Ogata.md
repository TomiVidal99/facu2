Hay tres teorías de control: clásica, moderna y robusta. Ogata habla principalmente de las dos primeras, al final hay una breve introducción a la robusta.

### Teoría clásica de control
Es sólo aplicable a sistemas con una entrada/salida invariantes en el tiempo; y se limita a una aproximación en el dominio frecuencial.
### Teoría moderna de control
Es aplicable a sistemas MIMO, lineales o no, variantes o no en el tiempo; y es básicamente un aproximación en el dominio del tiempo.

## Conceptos importantes del control moderno
1. Estado
2. Variables de estado
3. Vector de estado
4. Espacio de estados
5. Ecuaciones en el espacio de estados

## Solución a la ecuación de estados
Para resolver la ecuación de estados se llega a la conclusión que la forma general de su solución es:
$$x(t)=\left(\textbf{I}+\textbf{A}t + \frac{\textbf{A}^{2}t^{2}}{2} + \frac{\textbf{A}^{3}t^{3}}{3} + \dots \right) \textbf{x}_0 $$
Donde $\textbf{A}$ es la matriz del espacio de estados, $\textbf{I}$ es la matriz identidad y $\textbf{x}_0$ es el vector de condiciones iniciales (considerando $t=0$, pero se podría tomar un tiempo distinto también).
Pero para que sea  más fácil denotar todo esto, se usa la siguiente notación (*que no es calculable*)
$$x(t)=e^{\textbf{A}t}\textbf{x}_0=\phi(t)\textbf{x}_0$$

## $e^{\textbf{A}t}=\phi(t)$ se cumple siempre si el sistema es LIT

Si se considera un $t\neq0$ entonces:
$$x(t)=e^{\textbf{A}(t-\tau)}\textbf{x}(\tau)=\phi(t-\tau)\textbf{x}(\tau)$$
Donde a $\phi(t)$ se la denomina **Matriz de Transición de Estados**
La salida $y(t)$ queda fácilmente determinada con esta matriz de transición de estados, ya que son combinaciones lineales de los estados:
$$y(t)=\textbf{C}\phi(t)\textbf{x}_0$$
## Propiedades de la matriz de transición de estados
**Para un sistema lineal e invariante en el tiempo**
![[Pasted image 20240413082611.png]]
## Cómo encontrar/calcular $\phi(t)$?
Bueno básicamente existen 3 formas: por $Laplace$, haciendo diagonalización y por Cayley-Hamilton. La solución por diagonalización es simplemente llevar la matriz $\textbf{A}$ a su forma diagonal si se puede, y expresar el resultado *fácilmente* a partir de esta nueva matriz: $e^{\textbf{A}t}=e^{\textbf{P}^{-1}\textbf{D}\textbf{P}t}=\textbf{P}^{-1}e^{\textbf{A}t}\textbf{P}$
En particular si la matriz $\textbf{A}$ es diagonalizable y contiene $n$ autovalores distintos, entonces contendrá $n$ exponenciales:
![[Pasted image 20240413084056.png]]
### Solución por $Laplace$ 
Básicamente tomando la transformada de Laplace y su anti transformada para resolver el sistema de ecuaciones diferenciales se tiene lo siguiente:
$$ x(t) = \mathcal{L}^{-1}[(s\textbf{I}-\textbf{A})^{-1}]\textbf{x}(0) $$
Se puede escribir a $\textbf{x}(t) = \phi(t)\textbf{x}(0)$, que verifica todas las condiciones anteriores y por lo tanto es una solución válida. Pero se puede ver claramente que $\phi(t)$ es sólo una transformación de las condiciones iniciales. De acá se puede observar que $\phi(t)$ contiene información sobre el movimiento libre del sistema (es decir como evoluciona el mismo sin la influencia de agentes/fuerzas externas).

Donde se ve claramente que $\phi(t)$ es $\mathcal{L}^{-1}[(s\textbf{I}-\textbf{A})^{-1}]$, y para calcular esta anti transformada es útil saber:
![[Pasted image 20240411150915.png]]
También recordar de que la independencia en el tiempo para autovalores iguales se logra agregando $t, t^{2}, t^{3}, \dots$ 

# Solución de $\phi(t)$ no homogénea
![[Pasted image 20240413085707.png]]
Donde se ve claramente que el primer término es la respuesta del sistema al estado inicial y el segundo término es la respuesta a una entrada forzada.
Nuevamente aparecen métodos para resolver esta ecuación:
## Por $Laplace$
![[Pasted image 20240413090750.png]]


# El teorema de Cayley-Hamilton
Explicita que una matriz cuadrada de $n$x$n$ satisface su propia ecuación característica $p(\lambda)=0 \rightarrow p(\textbf{A})=0$ .
Hay que fijarse igual que $p(\lambda)$ sea el **polinomio de grado mínimo**, ya que es este el que tiene a $\textbf{A}$ como raíz.
Esto sirve por ejemplo para reducir los cálculos cuando tenemos matrices elevadas a un cierto exponente $n$.
Ya que por ejemplo si $n=2$ entonces:
Si tenemos un sistema con dinámica representada por $\textbf{A}$ talque tenga la ecuación característica es $p(\lambda)=\lambda^{2}-\lambda-2$, entonces:
$$ p(\textbf{A}) = \textbf{A}^{2} - \textbf{A} - 2\textbf{I} = 0 $$
$$ \textbf{A}^{2} = \textbf{A} + 2\textbf{I} $$
Que es mucho más fácil de calcular, además sirve para hacer deducciones sobre la estabilidad del sistema y para el diseño de controladores.


## Sylvester
Hasta ahora con lo que voy leyendo podría ser capaz de calcular $\phi(t)=e^{\textbf{A}t}$ de dos formas diferentes:
1. Con el método de diagonalización.
2. Con el método de $Laplace$.
Ahora se introduce un nuevo método que es la interpolación de Sylvester. Es básicamente plantear un determinante enorme que es igual a cero y que contiene $e^{\textbf{A}t}$, entonces de ahí se despeja el $\phi$ que queremos.
No es tan difícil en la práctica, pero es medio engorroso acordarse las formas, más si tiene raíces múltiples, que cambia un poco la forma del determinante.
*Nosotros lo vemos a este teorema como la resolución de Cayley-Hamilton*
![[Pasted image 20240415112754.png]]

# Diseño de sistemas de control en el espacio de estados
Hay básicamente dos métodos: asignación de polos (donde se asignan todos los polos a ciertas ubicaciones, análogo al método de lugar de raíces) y el regulador óptimo cuadrático.

## Asignación de polos
Se supone que todas las variables son medibles y que están disponibles para su realimentación, además el sistema tiene que ser controlable. Entonces dadas estas condiciones los polos de lazo cerrado se pueden ubicar en cualquier posición deseada.
La condición necesaria y suficiente para hacer la asignación de los polos es que el sistema sea de estados complemente controlable
![[Ogata - ingenieria-de-control-moderna-5ed.pdf#page=741&rect=70,165,514,638|Ogata - ingenieria-de-control-moderna-5ed, p.729]]


# Observadores de estado
En el método de asignación de polos para el diseño de control, se supuso que todas las variables estaban disponibles para su realimentación. Sin embargo, en la práctica no todas las variables de estado están accesibles para su realimentación. Entonces, se necesita estimar las variables de estado que no están disponibles. La estimación de variables de estado no medibles se denomina normalmente observación. Un dispositivo (o un programa de computador) que estima u observa las variables de estado se llama un observador de estado, o, simplemente, un observador. Si el observador de estado capta todas las variables de estado del sistema, sin importar si algunas están disponibles por medición directa, se denomina observador de estado de orden completo. Hay ocasiones en las que un observador de este tipo no es necesario, ya que sólo se requiere la observación de las variables de estado que no se miden, pero no de aquellas que también se miden directamente. Por ejemplo, como las variables de salida son observables y se relacionan en forma lineal con las variables de estado, no se necesita observar todas las variables de estado, sino sólo las n-m variables de estado, donde n es la dimensión del vector de estado y m es la dimensión del vector de salida

Un observador de estado estima las variables de estado basándose en las mediciones de las variables de salida y de control. Por lo tanto, el concepto de observabilidad juega un papel importante

## Observadores de estado completo
El problema de diseñar un observador de orden completo está en determinar la matriz de ganancias del observador Ke de forma que la dinámica de error definida mediante la Ecuación (10-59) sea asintóticamente estable con una velocidad de respuesta suficiente. (La estabilidad asintótica y la velocidad de respuesta de la dinámica de error se determinan mediante los valores característicos de la matriz A . KeC.) Por tanto, el diseño del observador de orden completo se convierte en determinar un Ke apropiado tal que A . KeC tenga los valores propios deseados. Por tanto, el problema es el mismo que en el caso de asignación de polos analizado en la Sección 10-2. De hecho, los dos problemas son matemáticamente el mismo. Esta propiedad se llama dualidad.

### Dualidad
![[Ogata - ingenieria-de-control-moderna-5ed.pdf#page=766&rect=82,109,512,212|Ogata - ingenieria-de-control-moderna-5ed, p.754]]
Por lo tanto con resolver el diseño de asignación de polos ya se tienen la matriz de ganancias del observador.
### Condición suficiente y necesaria
Como se dijo anteriormente es necesario que la matriz sea observable
![[Ogata - ingenieria-de-control-moderna-5ed.pdf#page=767&rect=227,586,366,607|Ogata - ingenieria-de-control-moderna-5ed, p.755]]

una vez seleccionados los valores propios deseados (o la ecuación característica deseada), se puede diseñar el observador de estado de orden completo, si la planta es completamente observable. Los valores propios deseados de la ecuación característica se deberían escoger de forma que el observador de estado responda al menos de dos a cinco veces más rápido que el sistema en lazo cerrado considerado. La ecuación para el observador de estado completo:![[Ogata - ingenieria-de-control-moderna-5ed.pdf#page=767&rect=222,435,369,456|Ogata - ingenieria-de-control-moderna-5ed, p.755]]
# Ejemplo de observadores de estados: pág 757

# Conclusiones importantes
1. Al diseñar un sistema regulador, obsérvese que si los polos dominantes del controlador se colocan suficientemente lejos a la izquierda del eje ju, los elementos de la matriz de ganancia de realimentación del estado K se harán grandes. Grandes valores de la ganancia harán que la salida del actuador sea también grande, de manera que puede dar lugar a saturación. Entonces el sistema diseñado no se comportará como estaba previsto.
2. También, al colocar los polos del observador suficientemente lejos a la izquierda del eje ju, el controlador observador se hace inestable, aunque el sistema en lazo cerrado es estable. Un controlador observador inestable no es aceptable.
3. Si el controlador observador se hace inestable, se mueven los polos del observador a la derecha en el semiplano izquierdo del plano s hasta que se estabilice. También, la localización de los polos en lazo cerrado deseados pueden tener que modificarse.
4. Obsérvese que si los polos del observador se colocan suficientemente lejos a la izquierda del eje ju, el ancho de banda del observador aumentará y originará problemas de ruido. Si hay un problema de ruido serio, los polos del observador no deberían colocarse demasiado lejos a la izquierda del eje ju. El requisito general es que el ancho de banda debería ser suficientemente bajo para que el ruido del sensor no se convierta en un problema.
5. El ancho de banda del sistema con el observador de orden mínimo es más grande que con el observador de orden completo, ya que los polos múltiples del observador se sitúan en el mismo lugar para ambos observadores. Si el ruido del sensor es un problema serio, se recomienda utilizar un observador de orden completo.

![[Ogata - ingenieria-de-control-moderna-5ed.pdf#page=804&rect=86,36,519,291|Ogata - ingenieria-de-control-moderna-5ed, p.792]]
![[Ogata - ingenieria-de-control-moderna-5ed.pdf#page=805&rect=79,469,513,651|Ogata - ingenieria-de-control-moderna-5ed, p.793]]
