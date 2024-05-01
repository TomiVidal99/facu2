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

InitConditionsLoaded, Jump  LoadTestData  / Cargo datos de prueba en la posición donde irían los datos

/ Vuelvo a cargar las condiciones inciales
TestDataLoaded,       Load  Zero / Index = 0
                      Store Index

                      Load    InitialDataAddr / DataPtr = 0x0002
                      Store   DataPtr

                      Load    TestDataAddr / TempAddr = TestDataAddr
                      Store   TempAddr

                      Jump    BubbleSort

/ TODO: corroborar condiciones inciales
/ *DataLengthPtr > 0?
/ Jump Terminate

Jump BubbleSort
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Entry Point del algoritmo de ordenamiento
/ es un bucle 'while' que itera cada posición del vector de datos
/ y los va ordenando en la misma posición de memoria
BubbleSort,   Load  Index  / Index++
              Add   One
              Store Index

              / Almaceno temporalemente el dato
              / del valor actual: a[i]
              / y su posición de memoria: &a[i]
              / Temp = *DataPtr
              LoadI DataPtr
              Store Temp

              / TempAddr = &(*DataPtr)
              Load  DataPtr
              Store TempAddr

              / Leo el siguiente dato: a[i+1]
              Add   One
              Store DataPtr

              / Veo si el dato actual requiere permutación
              / con el siguiente, es decir: a[i] > a[i+1] ? permutar() : continue
              LoadI DataPtr
              Subt  Temp
              Skipcond 000 / if (a[i+1]-a[i] < 0) { permutar() } else { continue };
              Jump BubbleSort / continuar el loop

              / Ahora si, si se requiere a partir de
              / acá empieza a hacerse la permutación
              / de a[i] con a[i+1]

              LoadI   DataPtr / Cargo en ACC el siguiente dato: a[i+1]
              StoreI  TempAddr / se almacena en: &a[i]

              LoadI   Temp / Cargo en ACC a[i] que estaba en Temp
              StoreI  DataPtr / Se almacena en &a[i+1]

              / Corroboro que no sea la ultima posición de memoria del vector
              / if (*DataLengthPtr <= Index) { return };
              LoadI     DataLengthPtr
              Subt      Index
              Skipcond  800
              Jump      Sorted

              / TODO: sacar esto?
              Jump BubbleSort / continuar el bucle
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Una vez que se termina el ordenamiento por Bubble Sort
/ se salta a esta subrutina que termina el programa
Sorted,     Load    Index
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
LoadTestData, Load  Index  / Index++
              Add   One
              Store Index

              / Cargar dato en la posición a[i]
              LoadI     TempAddr
              StoreI    DataPtr

              / Dirección del vector de datos mio
              / TempAddr++
              Load      TempAddr
              Add       One
              Store     TempAddr

              / Dirección del vector de datos 'dado'
              / DataPtr++
              Load      DataPtr
              Add       One
              Store     DataPtr

              / Corroboro que no sea la ultima posición de memoria del vector
              Load      MyVectorLength
              StoreI    DataLengthPtr
              Subt      Index
              Skipcond  800
              Jump      TestDataLoaded

              Jump      LoadTestData
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/ Cargo las condiciones iniciales
LoadIntialConditions,   Load    Zero  / Index = 0
                        Store   Index

                        Load    InitialDataAddr / DataPtr = 0x0002
                        Store   DataPtr

                        Load    TestDataAddr
                        Store   TempAddr

                        Jump    InitConditionsLoaded
/ - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

/ Constantes
DataLengthPtr,    HEX 0001
DataPtr,          HEX 0002
InitialDataAddr,  HEX 0002
Temp,             DEC 0
TempAddr,         HEX 0001
Index,            DEC 0
One,              DEC 1
Zero,             DEC 0
TestDataAddr,     HEX 0147

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
