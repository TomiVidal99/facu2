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

/ Sobre el programa: el entry point sería BubbleSort.
/ 
/ TODO: conservar esto???
/ implementé el Terminate en vez de simplemente usar Halt, por si 
/ necesitaba o se desea ampliar a una funcion de clean up.

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Comienza el programa
ORG 100

Jump LoadIntialConditions / Condiciones iniciales

InitConditionsLoaded, Jump  GenerateData  / Cargo datos de prueba en la posición donde irían los datos

/ Vuelvo a cargar las condiciones inciales
TestDataLoaded,       Load  Zero / iIndex = 0
                      Store iIndex

                      Load    InitialDataAddr / DataPtr = 0x0002
                      Store   DataPtr

                      Load    TestDataAddr / aJAddr = TestDataAddr
                      Store   aJAddr

                      Jump    BubbleSortInit

/ TODO: corroborar condiciones inciales
/ *DataLengthPtr > 0?
/ Jump Terminate

/ Jump BubbleSortInit
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Entry Point del algoritmo de ordenamiento
/ es un bucle 'while' que itera cada posición del vector de datos
/ y los va ordenando en la misma posición de memoria
/ -> Esto replica tal cual el diagrama de flujo provisto
BubbleSortInit, Load  Zero
                Store iIndex / i = 0
                Store jIndex / i = 0

                / i < n ?
                / si -> ir a (j<n-i-1?)
                / no -> terminar bucle
StartILoop,     LoadI     DataLengthPtr
                Subt      iIndex
                Skipcond  800
                Jump      SortEnded 

                / j = 0
                Load      Zero
                Store     jIndex

                / j < n-i-1 ?
                / si -> ver si permutar datos
                / no -> i++
AfterStartILoop,LoadI     DataLengthPtr
                Subt      iIndex
                Subt      One
                Subt      jIndex
                Skipcond  800
                Jump      IncrementI

                / Compruebo si se tienen que permutar los datos
                / para eso debo guardo temporalemente el dato a[j]
                / y la dirección de a[j] (&a[j])
                Load      DataPtr
                Add       jIndex
                Store     aJAddr

                / incremento la dirección &a[j+1]
                Add       One
                Store     aJ1Addr

                / temp = a[j]
                LoadI     aJAddr
                Store     aJData

                / a[j] > a[j+1] ?
                / si -> permutar
                / no -> j++
                LoadI     aJ1Addr     / a[j+1]
                Subt      aJData      / a[j]
                Skipcond  000
                Jump      IncrementJ

                / Se permutan los datos

                / almaceno en &a[j] el dato de a[j+1]
                LoadI     aJ1Addr
                StoreI    aJAddr

                / almaceno en &a[j+1] el dato temporal (antiguo a[j])
                Load      aJData
                StoreI    aJ1Addr

                / j++
IncrementJ,     Load      jIndex
                Add       One
                Store     jIndex

                Jump      AfterStartILoop


                / i++
IncrementI,     Load  iIndex
                Add   One
                Store iIndex
                Jump  StartILoop


/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Una vez que se termina el ordenamiento por Bubble Sort
/ se salta a esta subrutina que termina el programa
SortEnded,  Load    iIndex
            Output
            Jump    Terminate

Terminate,  Halt
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Esto es para mi básicamente, es para testear
/ Con esto genero datos en las posiciones de memoria
/ correspondientes para no tener que hacerlo manualmente
/ en 'marie.js'
GenerateData, Load    MyVectorLength / Carga el tamaño del vector en memoria
              StoreI  DataLengthPtr

              / Cargo el vector en memoria
LoadTestData, Load  iIndex  / iIndex++
              Add   One
              Store iIndex

              / Cargar dato en la posición a[j]
              LoadI     aJAddr
              StoreI    DataPtr

              / Dirección del vector de datos mio
              / &a[j]++
              Load      aJAddr
              Add       One
              Store     aJAddr

              / Dirección del vector de datos 'dado'
              / DataPtr++
              Load      DataPtr
              Add       One
              Store     DataPtr

              / Corroboro que no sea la ultima posición de memoria del vector
              Load      MyVectorLength
              Subt      iIndex
              Skipcond  800
              Jump      TestDataLoaded

              Jump      LoadTestData
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Cargo las condiciones iniciales
LoadIntialConditions,   Load    Zero  / iIndex = 0
                        Store   iIndex

                        Load    InitialDataAddr / DataPtr = 0x0002
                        Store   DataPtr

                        Load    TestDataAddr
                        Store   aJAddr

                        Jump    InitConditionsLoaded
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ Constantes
DataLengthPtr,    HEX 0001
DataPtr,          HEX 0002
InitialDataAddr,  HEX 0002
aJ1Addr,          DEC 0
aJ1Data,          DEC 0
aJAddr,           DEC 0
aJData,           DEC 0
iIndex,           DEC 0
jIndex,           DEC 0
One,              DEC 1
Zero,             DEC 0
TestDataAddr,     HEX 0159
Neg,              DEC -1

/ Testing Data
MyVector,         DEC 0
                  DEC -1
                  DEC 10
                  DEC -50
                  DEC 3
                  DEC 33
                  DEC 100
                  DEC -20
MyVectorLength,   DEC 8
