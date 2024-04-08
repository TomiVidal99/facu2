En control 1 usábamos Laplace para encontrar una relación entre entradas y salidas, pero Laplace elimina las condiciones iniciales, por lo que ahora usamos un método más abarcativo que es la representación por modelos de variables de estado, donde se tienen en cuenta 
Se basa en representar al sistema (entradas/salidas) mediante un sistema de ecuaciones que involucran los elementos que almacenan energía o tienen "memoria" (son variables independientes además de las entradas). 

![[Pasted image 20240407195955.png]]

Este sistema de ecuaciones es matricial, cada variable es un vector.
- Donde x' es el vector derivada de las variables con memoria.
- x es el vector de las variables con memoria.
- u es el vector de las entradas de señal independientes.
- y es el vector de las salidas de señal.
- A, B, C y D son las matrices que describen al sistema en esencia, las mismas NO son únicas, es decir hay infinitas representaciones con matrices equivalentes (esto es debido a qué se considera entrada/salida respecto de los componentes con memoria es muy relativo).

Como trabajamos con sistemas de tipo SISO LIT, sin realimentación (creo que la realimentación es lo importante) no tenemos matriz D, es decir D=0.

Hay una relación entre el modelos de Laplace y variables de estados:
![[Pasted image 20240407202736.png]]

En particular el determinante de (sI-A) es un polinomio de grado n. Si se iguala a cero se obtienen los n polos de la función de transferencia, que también coinciden con los autovalores, por eso se usan los autovalores.
# $$\lambda_{1}, \lambda_{2}, \lambda_{1}, \lambda_{n}$$
## Conclusión: la información de la dinámica del sistema (polos) se encuentra dentro de la matriz A. Por eso se la denomina *Matriz del Sistema*.
