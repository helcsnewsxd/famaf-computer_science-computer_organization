// Algunos colores
.equ AMARILLO, 0xFFF000
.equ AZUL, 0xFF
.equ AZUL_CLARO, 0x3333FF
.equ AZUL_OSCURO, 0x000066
.equ BLANCO, 0xFFFFFF
.equ CELESTE, 0x00FFEF
.equ GRIS, 0x808080
.equ MARRON, 0x663300
.equ NARANJA, 0xFF8000
.equ NEGRO, 0x0
.equ ROJO, 0xFF0000
.equ ROJO_CLARO, 0xFF3333
.equ ROJO_OSCURO, 0xCC0000
.equ ROSA, 0xFF66FF
.equ TURQUESA, 0x33FF99
.equ VERDE, 0xFF00
.equ VERDE_CLARO, 0x66FF66
.equ VERDE_OSCURO, 0x006600
.equ VIOLETA, 0xB300C0


.section .text

// ------------------------------------------- AMANECER PIOLA ------------------------------------------

// FONDO

.globl Dibuja_fondo_amanecer
Dibuja_fondo_amanecer:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x26,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=NARANJA
        mov x1,0
        mov x2,0
        mov x3,700
        mov x4,250
        mov x26,-1
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x26,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret


// SOLCITO DE AMANECER

.globl Dibuja_sol_amanecer
Dibuja_sol_amanecer:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x26,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=AMARILLO
		mov x1,500
		mov x2,100
		mov x3,50
		mov x26,-3
		bl Pinta_circulo

    ldr x30,[sp],8
    ldr x26,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret


// ACLARAR
.globl Aclarecer
Aclarecer:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x12,[sp,-8]!
    madd x12,x19,x20,x19
		lsl x12,x12,2
		add x12,x12,x29
		mov x1,x29
		Aclarecer_loop:
			cmp x1,x12
			b.gt Aclarecer_end
			mov x0,0
			ldr w0,[x1]
			ldr w2,=0xfefefe
			and w0,w0,w2
			//lsr w0,w0,1
			lsl w0,w0,1
			str w0,[x1]
			add x1,x1,4
			b Aclarecer_loop
		
		Aclarecer_end:
    ldr x12,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8
    ret


// ------------------------------------------- NOCHE PIOLA ------------------------------------------

// FONDO

.globl Dibuja_fondo_noche
Dibuja_fondo_noche:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x26,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=AZUL
        mov x1,0
        mov x2,0
        mov x3,700
        mov x4,250
        mov x26,-1
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x26,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret


// LUNA

.globl Dibuja_luna
Dibuja_luna:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x25,[sp,-8]!
    str x26,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=0xd0f0f0
		mov x1,500
		mov x2,100
		mov x3,50
		mov x26,0
		bl Pinta_circulo

        ldr x0,=AZUL
        mov x1,487
        mov x2,88
        mov x26,0
        bl Pinta_circulo


        // Arreglo el circulo azul
        mov x1,430
        mov x3,550
        mov x2,0
        mov x4,200
        mov x26,-1
        ldr x25,=AZUL
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x26,[sp],8
    ldr x25,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret


// OSCURECER
.globl Oscurecer
Oscurecer:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x12,[sp,-8]!
    madd x12,x19,x20,x19
		lsl x12,x12,2
		add x12,x12,x29
		mov x1,x29
		Oscurecer_loop:
			cmp x1,x12
			b.gt Oscurecer_end
			mov x0,0
			ldr w0,[x1]
			ldr w2,=0xfefefe
			and w0,w0,w2
			lsr w0,w0,1
			//lsl w0,w0,1
			str w0,[x1]
			add x1,x1,4
			b Oscurecer_loop
		
		Oscurecer_end:
    ldr x12,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8
    ret


// ------------------------------------------- PISO --------------------------------------------------------

.globl Dibuja_pasto
Dibuja_pasto:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x30,[sp,-8]!

    ldr x0,=0x37783b
        mov x1,1
        mov x2,223
        mov x3,x19
        mov x4,x20
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret



// ------------------------------------------- CONSTRUYE EDIFICIO ------------------------------------------
// Argumentos:
    // x0 -> color
    // (x1,x2), (x3,x4)
.globl Crea_edificio
Crea_edificio:

    //Guardo extremo sup izq y dato auxiliar para desarrollo de ventanas al final
    mov x11,x1
    mov x12,x2

    //Estos datos me van a ayudar a construir el loop de las ventanas
    mov x13,x3    // | --> extremo inferior
    mov x14,x4    // | 
    sub x16,x4,x2 // --> altitud del edificio
    sub x17,x3,x1 // --> ancho del edificio
    mov x18,0
    

    //-------------------Desarrollo de la pared frontal-------------------//

    ldr x0,=0x607d8b

    // Guardo en stack pointer para usar pinta rectangulo
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    // Llamo a pinta rectangulo
    bl Pinta_rectangulo

    //-------------------Desarrollo de los paralelogramos (derecha)-------------------//

    //Guardo color
    ldr x0,=0x78909c

    //Reacomodo puntos

    //Nuevo (x1,x2) --> x2 queda igual

        // Calculo auxiliar
        mov x9,0
        sub x9, x3, x1

    //Nuevo x1
    add x1,x1,x9

    //Nuevo (x5,x6) --> son el punto (x3,x4)
    mov x5,x3
    mov x6,x4

    //Nuevo (x3,x4)
    mov x3,x1
    add x3,x3,15

    mov x4,x2
    sub x4,x4,15

    //Nuevo (x7,x8)

    mov x7,x5
    add x7,x7,15

    mov x8,x6
    sub x8,x8,8

    // Guardo en stack pointer para usar pinta cuadrilatero

    bl Pinta_cuadrilatero


    //-------------------Desarrollo de los paralelogramos (arriba)-------------------//

    //Reacomodo puntos

    //Nuevo (x5,x6) --> son el punto (x3,x4)
    mov x5,x1
    mov x6,x2

    //Nuevo (x7,x8)
    mov x7,x3
    mov x8,x4

    //Nuevo (x1,x2) --> x2 queda igual
    //Nuevo x1
    sub x1,x1,x9

    //Nuevo (x3,x4)
    mov x3,x1
    add x3,x3,15

    mov x4,x2
    sub x4,x4,15

    // Guardo en stack pointer para usar pinta cuadrilatero

    bl Pinta_cuadrilatero
    
    //-------------------Desarrollo de ventanas-------------------//
    ldr x0,=0x37474f

    // ITERA COLUMNAS

    //Reacomodo puntos
    //Nuevo (x1, x2) --> Extremo sup izq
    add x1,x1,6
    mov x2, 0

loop1:
    mov x2, x12
    add x2,x2,15

    //Nuevo (x3,x4) --> Extremo inf der
    mov x3,x1
    mov x4,x2
    add x3,x1,10
    add x4,x2,10

    //Contador para comparar con x13
    mov x15,0
loop0:

    // Llamo a pinta rectangulo
    bl Pinta_rectangulo

    //Reacomodo puntos
    //Nuevo (x1, x2) --> Extremo sup izq (x1 queda igual)
    add x2,x2,20

    //Nuevo (x3,x4) --> Extremo inf der
    mov x3,x1
    mov x4,x2

    add x3,x1,10
    add x4,x2,10
    
    //Aumento x15
    add x15,x15,35

    cmp x16,x15 //x13 < x15 si cumple entonces pasa al else
    b.ge loop0 

    //COLUMNA DE AL LADO
    add x1, x1, 18

    add x18, x18,28
    cmp x17,x18
    b.ge loop1

    //-------------------Desarrollo de puertas-------------------//

    // Quiero tomar el punto del medio de cada edificio, sumarle sumarle 5 y restarle 5 para agarrar los demas extremos.
    // Tomo la mitad de la longitud del edificio (registro x17) haciendo un lsr x17 1
    ldr x0,=0x4e432e
    lsr x17,x17,1
    add x17,x17,x11
    // Ahora tomo mi extremo inferior derecho. Considero Y como el x14 (reg donde tengo guardado el x4 inicial)
    mov x3,x17
    add x3,x3,5
    mov x4,x14

    //Ahora tomo mi extremo superior izquierdo. Y es fijo. Depende de x14
    mov x1,x17
    sub x1,x1,5
    mov x2,x14
    sub x2,x2,20

    // Llamo a pinta rectangulo

    // Llamo a pinta rectangulo
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    

    ret


// ------------------------------------------- PINOS ------------------------------------------
.globl Pino1
Pino1: 
    str x0,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    // Guardo en (x11,x12) el punto inicial para cálculo auxiliar
    mov x11,x1
    mov x12,x2

// ------------------------------------------- TRONCO -------

    // Desarrollo de tronco, primer bloque
    ldr x0,=0xC8B199
    mov x3,x1
    add x3,x3,4

    mov x4,x2
    sub x2,x2,4
    bl Pinta_rectangulo      

    // Desarrollo de tronco, segundo bloque
    ldr x0,=0x998675
    add x1,x1,4
    
    add x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de tronco, tercer bloque
    ldr x0,=0x746457
    add x1,x1,4
    
    add x3,x3,4
    bl Pinta_rectangulo

// ------------------------------------------- CAPA 1 -------

    // Desarrollo de fila de hojas, primer fila
    ldr x0,=0x3AB54B
    mov x1,x11
    mov x2,x12 // seteo de variables

    sub x1,x1,15 // reacomodo punto inicial
    sub x2,x2,5

    mov x3,x1    // seteo de segundo punto
    mov x4,x2

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,42
    bl Pinta_rectangulo

    mov x13,x3            // Guardo en (x13,x14) para cálculo auxiliar.
    mov x14,x4 

    // Ahora tengo mis (x1,x2) y (x3,x4) para cada rectangulo de cada hoja de filas, solo tengo que restar y sumar algunos parámetros
    // Guardo (x1,x2) en (x5,x6)
    mov x5,x1
    mov x6,x2

    // Desarrollo de fila de hojas, segunda fila

    add x1,x1,8 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,8
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, tercer fila

    sub x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, cuarta fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, quinta fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, sexta fila

    sub x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, septima fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, octava fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, novena fila

    sub x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, decima fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, onceava fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, doceava fila

    sub x2,x2,4 // reacomodo punto inicial

    sub x4,x4,4 // reacomodo segundo punto
    bl Pinta_rectangulo

// ------------------------------------------- CAPA 2 -------

    //Tengo en (x5,x6) y (x13,x14) los valores del primer rectángulo , tengo que hacer lo mismo pero con otro color.
    ldr x0,=0x009345
    mov x1,x5
    mov x2,x6
    mov x3,x13
    mov x4,x14

    // Una vez teniendo los nuevos (x1,x2) y (x3,x4) voy a querer que la primera coordenada este más a la derecha
    // Primera fila de hojas
    add x1,x1,19
    bl Pinta_rectangulo

    // Segunda fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,8
    bl Pinta_rectangulo

    // Tercera fila de hojas
    sub x1,x1,4
    sub x2,x2,4
    
    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Cuarta fila de hojas
    add x1,x1,4
    sub x2,x2,4
    
    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Quinta fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Sexta fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Septima fila de hojas
    add x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Octava fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Novena fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Decima fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

// ------------------------------------------- CAPA 3 -------


    // Vuelvo a setear los x1,x2,x3,x4
    ldr x0,=0x006837
    mov x1,x5
    mov x2,x6
    mov x3,x13
    mov x4,x14

    // Primera fila de hojas
    add x1,x1,30 // Acomodo puntos, solo cambio el x1
    bl Pinta_rectangulo

    // Segunda fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,8
    bl Pinta_rectangulo

    // Tercera fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Cuarta fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Quinta fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Quinta fila de hojas
    add x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Sexta fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Septima fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Octava fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Novena fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo



    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x0,[sp],8

    ret

.globl Pino2
Pino2:
    str x0,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    // Guardo en (x11,x12) el punto inicial para cálculo auxiliar
    mov x11,x1
    mov x12,x2

// ------------------------------------------- TRONCO -------

    // Desarrollo de tronco, primer bloque
    ldr x0,=0xC8B199
    mov x3,x1
    add x3,x3,3

    mov x4,x2
    sub x2,x2,3
    bl Pinta_rectangulo      

    // Desarrollo de tronco, segundo bloque
    ldr x0,=0x998675
    add x1,x1,3
    
    add x3,x3,3
    bl Pinta_rectangulo

    // Desarrollo de tronco, tercer bloque
    ldr x0,=0x746457
    add x1,x1,3
    
    add x3,x3,3
    bl Pinta_rectangulo

// ------------------------------------------- CAPA 1 -------

    // Desarrollo de fila de hojas, primer fila
    ldr x0,=0x3AB54B
    mov x1,x11
    mov x2,x12 // seteo de variables

    sub x1,x1,15 // reacomodo punto inicial
    sub x2,x2,5

    mov x3,x1    // seteo de segundo punto
    mov x4,x2

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,42

    // Tengo (x1,x2) y (x3,x4) del primer rectángulo de la pila. Debo hacerlos menos anchos y un poco mas baja.

    add x1,x1,4
    sub x3,x3,4

    add x2,x2,2
    add x4,x4,2

    bl Pinta_rectangulo

    mov x13,x3            // Guardo en (x13,x14) para cálculo auxiliar.
    mov x14,x4 

    // Ahora tengo mis (x1,x2) y (x3,x4) para cada rectangulo de cada hoja de filas, solo tengo que restar y sumar algunos parámetros
    // Guardo (x1,x2) en (x5,x6)
    mov x5,x1
    mov x6,x2


    // Desarrollo de fila de hojas, segunda fila

    add x1,x1,8 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,8
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, tercer fila

    sub x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, cuarta fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, quinta fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, sexta fila

    sub x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, septima fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Desarrollo de fila de hojas, octava fila

    add x1,x1,4 // reacomodo punto inicial
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

// ------------------------------------------- CAPA 2 -------

    //Tengo en (x5,x6) y (x13,x14) los valores del primer rectángulo , tengo que hacer lo mismo pero con otro color.
    ldr x0,=0x009345
    mov x1,x5
    mov x2,x6
    mov x3,x13
    mov x4,x14

    // Una vez teniendo los nuevos (x1,x2) y (x3,x4) voy a querer que la primera coordenada este más a la derecha
    // Primera fila de hojas
    add x1,x1,19
    bl Pinta_rectangulo

    // Segunda fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,8
    bl Pinta_rectangulo

    // Tercera fila de hojas
    sub x1,x1,4
    sub x2,x2,4
    
    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Cuarta fila de hojas
    add x1,x1,4
    sub x2,x2,4
    
    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Quinta fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Sexta fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Septima fila de hojas
    add x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Octava fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

// ------------------------------------------- CAPA 3 -------


    // Vuelvo a setear los x1,x2,x3,x4
    ldr x0,=0x006837
    mov x1,x5
    mov x2,x6
    mov x3,x13
    mov x4,x14

    // Primera fila de hojas
    add x1,x1,28 // Acomodo puntos, solo cambio el x1
    bl Pinta_rectangulo

    // Segunda fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,8
    bl Pinta_rectangulo

    // Tercera fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Cuarta fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Quinta fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Quinta fila de hojas
    add x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    add x3,x3,4
    bl Pinta_rectangulo

    // Sexta fila de hojas
    sub x1,x1,4
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    // Septima fila de hojas
    sub x2,x2,4

    sub x4,x4,4 // reacomodo segundo punto
    sub x3,x3,4
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x0,[sp],8

    ret


// ------------------------------------------- Arbusto1 ------------------------------------------
.globl Arbusto1
Arbusto1:
    //Argumentos: 2 puntos --> (x1,x2) y (x3,x4)

    str x0,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    ldr x0,=0x009345 
    
// Creo el rectángulo horizontal

    // Guardo los puntos iniciales por las dudas
    mov x11,x1
    mov x12,x2
    mov x13,x3
    mov x14,x4

    add x2,x2,3
    sub x4,x4,3
    bl Pinta_rectangulo // Pinta el rectángulo horizontal.

// Creo el rectángulo vertical

    sub x2,x2,3
    add x4,x4,3
    add x1,x1,3
    sub x3,x3,3

    bl Pinta_rectangulo // Pinta el rectángulo vertical.

    // Una vez obtengo la base, necesito el sombreado para que parezca efectivamente un arbusto
    // Reacomodo mis variables

// Hago el "sombreado"
    ldr x0,=0x3AB54B
    sub x4,x4,3
    add x1,x1,8
    bl Pinta_rectangulo

    add x1,x1,2

    add x4,x4,3
    bl Pinta_rectangulo

    sub x1,x1,4
    add x2,x2,3
    sub x4,x4,5
    sub x3,x3,2
    bl Pinta_rectangulo

    sub x1,x1,3
    sub x4,x4,5
    sub x3,x3,2
    bl Pinta_rectangulo

    mov x1,x13
    sub x1,x1,4
    mov x2,x12
    add x2,x2,3
    mov x3,x13
    mov x4,x14
    sub x4,x4,3
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x0,[sp],8

    ret


