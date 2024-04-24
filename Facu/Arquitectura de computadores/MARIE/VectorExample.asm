/ ORG 100

Clear / Limpio memoria por las dudas que haya algo anterior
Load  MemStart / Cargo el comienzo del vector en el acumulador
Store MemPointer / Le cargo al puntero la direccion del valor i-esimo del vector que estaba en el acumulador
Loop, 	LoadI MemPointer
		Output / Muestra el valor actual 
		Load MemPointer
	 	Add One
        Store MemPointer
        Subt MemFinish
		Skipcond 400
        Jump Loop

Halt


Vector, 	DEC 0
			DEC 1
            DEC	2
            DEC	3
            DEC 4
            DEC 5
            DEC 6
MemPointer,	DEC	0
MemStart,	DEC	12
MemFinish,	DEC	19
One,		DEC	1
