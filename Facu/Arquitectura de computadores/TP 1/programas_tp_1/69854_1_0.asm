/ Proyecto Integrador. Practica 1 Arquitectura de Computadoras
/ Nombre: Tomas Vidal (69854/4)
/ Algoritmo utilizado: Bubble sort
/ Ocupacion de memoria de programa: ...
/ Ocupacion de memoria de datos (sin incluir el vector): ...
/ Performance
/ Vector ordenado -3,-2,-1,0,1,2,3 : ... instrucciones
/ Vector invertido 3,2,1,0,-1,-2,-3 : ... instrucciones
/ Vector desordenado 0,-2,1,3,-1,2,-3 : ... instrucciones

/ El algoritmo es muy sencillo, simplemente veo si el numero actual es menor o mayor que 
/ el siguiente y en base a eso los intercambio de posicion o no. Por esto  es que solamente
/ require un espacio extra de memoria, ya que necesito un lugar donde almacenar temporalemente
/ los datos.

/ Sobre el programa: el entry point sería BubbleSort.

/ TODO: corroborar condiciones inciales
/ *DataLengthPtr > 0?

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Comienza el programa
ORG 100

Jump LoadIntialConditions / Condiciones iniciales

InitConditionsLoaded, Jump  GenerateData  / Cargo datos de prueba en la posicion donde irían los datos

/ Vuelvo a cargar las condiciones inciales
TestDataLoaded,       Load  Zero / iIndex = 0
                      Store iIndex

                      / aJAddr = TestDataAddr
                      Load    TestDataAddr
                      Store   aJAddr

                      / DataPtr = DataPtrAddr
                      Load    DataPtrAddr
                      Store   DataPtr

                      Jump    DisplayVector

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Entry Point del algoritmo de ordenamiento
/ es un bucle 'while' que itera cada posicion del vector de datos
/ y los va ordenando en la misma posicion de memoria
/ -> Esto replica tal cual el diagrama de flujo provisto
BubbleSortInit, Load  Zero
                Store iIndex / i = 0
                Store jIndex / i = 0

                / DisplayRtrnPath++
                Load    DisplayRtrnPath
                Add     One
                Store   DisplayRtrnPath

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
                / y la direccion de a[j] (&a[j])
                Load      DataPtr
                Add       jIndex
                Store     aJAddr

                / incremento la direccion &a[j+1]
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
SortEnded,    Jump  DisplayVector
AfterFinish,  Halt

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Esto es para mi basicamente, es para testear
/ Con esto genero datos en las posiciones de memoria
/ correspondientes para no tener que hacerlo manualmente
/ en 'marie.js'
GenerateData, Load    MyVectorLength / Carga el tamaño del vector en memoria
              StoreI  DataLengthPtr

              / Cargo el vector en memoria
LoadTestData, Load  iIndex  / iIndex++
              Add   One
              Store iIndex

              / Cargar dato en la posicion a[j]
              LoadI     aJAddr
              StoreI    DataPtr

              / Direccion del vector de datos mio
              / &a[j]++
              Load      aJAddr
              Add       One
              Store     aJAddr

              / Direccion del vector de datos 'dado'
              / DataPtr++
              Load      DataPtr
              Add       One
              Store     DataPtr

              / Corroboro que no sea la ultima posicion de memoria del vector
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

                        Load    TestDataAddr
                        Store   aJAddr

                        Jump    InitConditionsLoaded
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Muestro el vector resultante en la salida
DisplayVector,          Load    Zero  / iIndex = 0
                        Store   iIndex

                        / print(a[i])
iLoopDisplay,           Load    DataPtr
                        Add     iIndex
                        Store   aJAddr
                        LoadI   aJAddr
                        Output

                        / i++
                        Load    iIndex
                        Add     One
                        Store   iIndex

                        / i < n ?
                        LoadI   DataLengthPtr
                        Subt    iIndex
                        Skipcond 800
                        Jump    FinishDisplayVector

                        Jump    iLoopDisplay

                        / verifico a donde debe ir cuando termine
                        / el bucle
                        / switch (DisplayRtrnPath) {
                        /  case 0: Goto BubbleSortInit
                        /  case 1: Goto AfterFinish
                        / }
FinishDisplayVector,    Load  DisplayRtrnPath
                        Skipcond  400
                        Jump  AfterFinish
                        Jump  BubbleSortInit
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ Constantes
DataPtrAddr,      HEX 0002
One,              DEC 1
Zero,             DEC 0

/ Variables
DataPtr,          HEX 0002
DataLengthPtr,    HEX 0001
aJ1Addr,          DEC 0
aJAddr,           DEC 0
aJData,           DEC 0
iIndex,           DEC 0
jIndex,           DEC 0
DisplayRtrnPath,  DEC 0
LoadICRtrnPath,   DEC 0

/ Testing Data (constantes)
TestDataAddr,     HEX 016B
MyVector,         DEC -3
                  DEC -2
                  DEC -1
                  DEC 0
                  DEC 1
                  DEC 2
                  DEC 3
MyVectorLength,   DEC 7
