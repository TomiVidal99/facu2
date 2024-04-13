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
Si se considera un $t\neq0$ entonces:
$$x(t)=e^{\textbf{A}(t-\tau)}\textbf{x}(\tau)=\phi(t-\tau)\textbf{x}(\tau)$$
Donde a $\phi(t)$ se la denomina **Matriz de Transición de Estados**
La salida $y(t)$ queda fácilmente determinada con esta matriz de transición de estados, ya que son combinaciones lineales de los estados:
$$y(t)=\textbf{C}\phi(t)\textbf{x}_0$$

### Solución por $Laplace$ 
Básicamente tomando la transformada de Laplace y su anti transformada para resolver el sistema de ecuaciones diferenciales se tiene lo siguiente:
$$ x(t) = \mathcal{L}^{-1}[(s\textbf{I}-\textbf{A})^{-1}]\textbf{x}(0) $$
Se puede escribir a $\textbf{x}(t) = \phi(t)\textbf{x}(0)$, que verifica todas las condiciones anteriores y por lo tanto es una solución válida. Pero se puede ver claramente que $\phi(t)$ es sólo una transformación de las condiciones iniciales. De acá se puede observar que $\phi(t)$ contiene información sobre el movimiento libre del sistema (es decir como evoluciona el mismo sin la influencia de agentes/fuerzas externas).

Donde se ve claramente que $\phi(t)$ es $\mathcal{L}^{-1}[(s\textbf{I}-\textbf{A})^{-1}]$, y para calcular esta anti transformada es útil saber:
![[Pasted image 20240411150915.png]]
También recordar de que la independencia en el tiempo para autovalores iguales se logra agregando $t, t^{2}, t^{3}, \dots$ 

## TODO: propiedades de la matriz de transición de estados

# El teorema de Cayley-Hamilton
Explicita que una matriz cuadrada de $n$x$n$ satisface su propia ecuación característica $p(\lambda)=0 \rightarrow p(\textbf{A})=0$ .
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