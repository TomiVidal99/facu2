Se ven diferentes formas de representar las variables de estados. A las mismas se las llaman formas canónicas: **Controlable**, **Diagonal** y **Observable**.

## Controlable
Básicamente se toma la transferencia del sistema y se sabe que eso es una constante por los ceros y polos. Entonces si nos inventamos una función intermedia tal que la salida sobre esta función y esto por la función sobre la entrada seguimos teniendo el mismo sistema.
![[Pasted image 20240407210129.png]]
Pero ahora tenemos una relación tal que esta función por el polinomio de los polos es igual a la entrada.
Esto logra que la **forma canónica controlable** haga que A y B sean:
![[Pasted image 20240407205743.png]]
Y ahora planteando la salida sobre la función  igual al polinomio de los ceros se obtiene la matriz C.
![[Pasted image 20240407210053.png]]

## Diagonal
Ahora se plantea otra relación de la transferencia del sistema, esta es la sumatoria de los residuos:
![[Pasted image 20240407210327.png]]
Se considera una nueva variable que se la llama Xn que es todo el término n menos el residuos. Es decir:
![[Pasted image 20240407221945.png]]
Entonces la matriz A y B resultan:
![[Pasted image 20240407222004.png]]
y como queda el vector de la señal de salida Y igual a una sumatoria de los residuos por estas variables Xn, la matriz C resulta en el vector de los residuos:
![[Pasted image 20240407222120.png]]
### Todo esto era solamente si los polos son reales simples

### Si ahora se consideran polos reales múltiples:
![[Pasted image 20240407222356.png]]

### Y si son polos complejos conjugados
![[Pasted image 20240407222514.png]]

## Observable 
Se consideran los términos de igual orden de **s** (como potencias negativas de s) todo igualado a cero, a partir de la transferencia del sistema como en los casos previos.
Después se saca factor común 1/s y se definen las Xn a partir de observar el resultado.
![[Pasted image 20240407223138.png]]
![[Pasted image 20240407223211.png]]
Por lo que las matrices A,B y C resultan:
![[Pasted image 20240407223459.png]]

Despues faltarían las transformaciones, cómo ir de variables de estados a transformaciones con propiedades matriciales.


## Comandos Matlab
- sys = ss(A,B,C,D)
- sys2 = ss2ss(sys,M)
	$$X=M\overline X$$
	$$ \overline X = MX$$
	