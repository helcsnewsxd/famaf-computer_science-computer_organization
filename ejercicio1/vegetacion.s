.section .text

.globl Tronco2
Tronco2:

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x30,[sp,-8]!

    ldr x0,=0x4E2D12
    mov x3,x1
    mov x4,x2

    add x3,x3,3
    sub x1,x1,3
    sub x4,x4,15
    add x2,x2,1
    bl Pinta_rectangulo

    sub x2,x2,1
    add x4,x4,1
    sub x1,x1,3
    add x3,x3,3
    bl Pinta_rectangulo

    add x4,x4,1
    sub x2,x2,1
    sub x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo

    mov x1,x3
    ldr x0,=0x643A19
    sub x2,x2,4
    bl Pinta_rectangulo

    add x4,x4,10
    add x2,x2,4
    bl Pinta_rectangulo

    sub x1,x1,4
    sub x3,x3,4
    add x2,x2,2
    sub x4,x4,4
    bl Pinta_rectangulo

    ldr x0,=0x73431D
    sub x4,x4,4
    mov x2,x4
    sub x2,x2,4
    bl Pinta_rectangulo

    ldr x0,=0x643A19
    sub x1,x1,4
    sub x3,x3,4
    sub x4,x4,2
    add x2,x2,10
    bl Pinta_rectangulo

    add x2,x2,4
    mov x4,x2
    add x4,x4,2
    bl Pinta_rectangulo

    ldr x0,=0x73431D
    sub x1,x1,4
    sub x3,x3,4

    mov x4,x2
    sub x2,x2,10
    bl Pinta_rectangulo

    ldr x0,=0x643A19
    sub x1,x1,4
    sub x3,x3,4
    sub x4,x4,4
    bl Pinta_rectangulo

    ldr x0,=0x874321
    add x1,x1,8
    add x3,x3,8
    sub x2,x2,2
    mov x4,x2
    add x4,x4,1
    sub x1,x1,4
    add x3,x3,4

    bl Pinta_rectangulo

    ldr x0,=0x9D5529
    add x2,x2,2
    add x4,x4,2
    bl Pinta_rectangulo

    sub x2,x2,4
    sub x4,x4,4
    bl Pinta_rectangulo

    add x2,x2,2
    add x4,x4,2
    sub x1,x1,2
    mov x3,x1
    add x3,x3,2
    bl Pinta_rectangulo

    add x1,x1,10
    add x3,x3,10
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

.globl Tronco1
Tronco1:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x13,[sp,-8]!
    str x14,[sp,-8]!
    str x30,[sp,-8]!

    ldr x0,=0x4E2D12
    mov x3,x1
    mov x4,x2
    add x3,x3,55
    add x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,2
    sub x4,x4,2
    add x3,x3,2
    sub x1,x1,2
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    add x3,x3,2
    sub x1,x1,2
    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo
    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    
    sub x3,x3,2
    add x1,x1,2
    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    sub x2,x2,1
    sub x4,x4,1
    bl Pinta_rectangulo

    add x1,x1,2
    sub x3,x3,2
    sub x2,x2,2
    sub x4,x4,2
    bl Pinta_rectangulo

    
    sub x3,x3,45
    bl Pinta_rectangulo

    ldr x0,=0x663C1A
    add x1,x1,15
    add x3,x3,36
    bl Pinta_rectangulo

    ldr x0,=0x663C1A
    add x1,x1,40
    add x3,x3,10
    bl Pinta_rectangulo

    sub x3,x3,20
    add x2,x2,4
    add x4,x4,4
    bl Pinta_rectangulo

    sub x3,x3,20
    sub x1,x1,30
    bl Pinta_rectangulo

    sub x3,x3,5
    sub x1,x1,18
    bl Pinta_rectangulo

    sub x3,x3,15
    bl Pinta_rectangulo


    add x2,x2,4
    add x4,x4,4
    add x1,x1,15
    bl Pinta_rectangulo

    mov x3,x1
    add x1,x1,15
    add x3,x3,4
    bl Pinta_rectangulo

    mov x3,x1
    add x1,x1,23
    add x3,x3,4
    bl Pinta_rectangulo

    add x2,x2,4
    add x4,x4,4
    sub x1,x1,10
    sub x3,x3,25
    bl Pinta_rectangulo

    mov x1,x3
    sub x3,x3,15
    sub x1,x1,4
    bl Pinta_rectangulo

    add x3,x3,53
    add x1,x1,46
    bl Pinta_rectangulo

    ldr x0,=0x593216
    sub x1,x1,45
    sub x3,x3,45
    bl Pinta_rectangulo

    add x1,x1,20
    add x3,x3,35
    bl Pinta_rectangulo

    mov x11,x1
    mov x12,x2
    mov x13,x3
    mov x14,x4

    sub x2,x2,4
    sub x4,x4,4
    sub x1,x1,15
    sub x3,x3,15
    bl Pinta_rectangulo


    ldr x0,=0x593216
    sub x2,x2,4
    sub x4,x4,4
    add x1,x1,30
    add x3,x3,30
    bl Pinta_rectangulo

    sub x2,x2,4
    sub x4,x4,4
    sub x1,x1,40
    sub x3,x3,40
    bl Pinta_rectangulo

    ldr x0,=0x9D5529
    sub x1,x1,15
    mov x3,x1
    add x2,x2,5
    add x4,x4,10
    add x1,x1,5
    add x3,x3,5
    bl Pinta_rectangulo

    add x1,x1,1
    add x3,x3,1
    bl Pinta_rectangulo

    ldr x0,=0x9D5529
    sub x2,x2,2
    sub x4,x4,6
    add x1,x1,1
    add x3,x3,1
    bl Pinta_rectangulo

    add x1,x1,1
    add x3,x3,1
    bl Pinta_rectangulo

    
    add x1,x1,1
    add x3,x3,1
    bl Pinta_rectangulo
    add x1,x1,1
    add x3,x3,1
    bl Pinta_rectangulo

    ldr x0,=0x9D5529
    add x1,x1,1
    add x3,x3,1
    bl Pinta_rectangulo

    add x2,x2,2
    add x4,x4,6
    add x1,x1,1
    add x3,x3,2
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,2
    sub x1,x1,2
    sub x3,x3,2

    bl Pinta_rectangulo
    sub x1,x1,1
    sub x3,x3,1
    bl Pinta_rectangulo

    sub x1,x1,1
    sub x3,x3,1
    bl Pinta_rectangulo
    sub x1,x1,1
    sub x3,x3,1
    bl Pinta_rectangulo

    ldr x0,=0x874321
    mov x3,x1
    sub x2,x2,5
    sub x4,x4,3
    add x3,x3,4
    bl Pinta_rectangulo

    mov x1,x11
    mov x2,x12
    mov x3,x13
    mov x4,x14

    ldr x30,[sp],8
    ldr x14,[sp],8
    ldr x13,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

// ------------------------------------------- PINOS ------------------------------------------

.globl Hojas
Hojas: 
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x13,[sp,-8]!
    str x14,[sp,-8]!
    str x30,[sp,-8]!

    // Guardo en (x11,x12) el punto inicial para cálculo auxiliar
    mov x11,x1
    mov x12,x2

// ------------------------------------------- SIN TRONCO -------



    // Desarrollo de tronco, primer bloque
    mov x3,x1
    add x3,x3,4

    mov x4,x2
    sub x2,x2,4     

    // Desarrollo de tronco, segundo bloque
    add x1,x1,4
    
    add x3,x3,4

    // Desarrollo de tronco, tercer bloque
    add x1,x1,4
    
    add x3,x3,4

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
    ldr x14,[sp],8
    ldr x13,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

// ------------------------------------------- Pino1 ------------------------------------------
.globl Pino1
Pino1:
// Argumentos: un punto (x1,x2)

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x13,[sp,-8]!
    str x14,[sp,-8]!
    str x30,[sp,-8]!

    // --- // 

    sub x1,x1,8
    bl Hojas
    add x1,x1,8

    // --- // 

    sub x1,x1,7
    bl Hojas
    add x1,x1,7

    // --- // 

    sub x1,x1,6
    bl Hojas
    add x1,x1,6

    // --- // 

    sub x1,x1,5
    bl Hojas
    add x1,x1,5


    // --- // 

    sub x1,x1,3
    bl Hojas
    add x1,x1,3

    // --- //

    add x1,x1,8
    bl Hojas
    sub x1,x1,8

    // --- //

    add x1,x1,7
    bl Hojas
    sub x1,x1,7

    // --- //

    add x1,x1,6
    bl Hojas
    sub x1,x1,6

    // --- //

    add x1,x1,5
    bl Hojas
    sub x1,x1,5

    // --- //

    add x1,x1,3
    bl Hojas
    sub x1,x1,3

    // --- //

    sub x2,x2,4
    bl Hojas
    add x2,x2,4

    // --- //

    sub x2,x2,8
    bl Hojas
    add x2,x2,8

    // --- //

    bl Pino2

    // --- //

    sub x2,x2,22
    bl Hojas
    add x2,x2,22

    // --- //

    ldr x30,[sp],8
    ldr x14,[sp],8
    ldr x13,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

// ------------------------------------------- Pino2 ------------------------------------------

.globl Pino2
Pino2: 
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x13,[sp,-8]!
    str x14,[sp,-8]!
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
    ldr x14,[sp],8
    ldr x13,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

// ------------------------------------------- Pino3 ------------------------------------------

.globl Pino3
Pino3:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x13,[sp,-8]!
    str x14,[sp,-8]!
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
    ldr x14,[sp],8
    ldr x13,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
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

// ---------------------------------- PASTO ----------------------------------

.globl Pasto_individual
Pasto_individual:
    // (x1,x2) --> posicion
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x30,[sp,-8]!

    ldr x0,=0x009345
		
    mov x5,x1
    mov x6,x2

    mov x1,x5
    mov x2,x6
    mov x3,x5
    sub x4,x6,4
    bl Pinta_linea

    mov x1,x5
    mov x2,x6
    add x3,x5,2
    sub x4,x6,4
    bl Pinta_linea

    mov x1,x5
    mov x2,x6
    sub x3,x5,2
    sub x4,x6,4
    bl Pinta_linea

    add x5,x5,3

    mov x1,x5
    mov x2,x6
    mov x3,x5
    sub x4,x6,4
    bl Pinta_linea

    mov x1,x5
    mov x2,x6
    add x3,x5,2
    sub x4,x6,4
    bl Pinta_linea

    mov x1,x5
    mov x2,x6
    sub x3,x5,2
    sub x4,x6,4
    bl Pinta_linea

    sub x5,x5,2
    sub x6,x6,3

    mov x1,x5
    mov x2,x6
    mov x3,x5
    sub x4,x6,4
    bl Pinta_linea

    mov x1,x5
    mov x2,x6
    add x3,x5,2
    sub x4,x6,4
    bl Pinta_linea

    mov x1,x5
    mov x2,x6
    sub x3,x5,2
    sub x4,x6,4
    bl Pinta_linea

    ldr x30,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8
    ret


.globl Pasto_grupal
Pasto_grupal:
    // (x1,x2) --> posicion
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x30,[sp,-8]!

    mov x3,x1
    mov x4,x2

        bl Pasto_individual
        add x1,x1,4
        bl Pasto_individual
        sub x1,x1,2
        sub x2,x2,4
        bl Pasto_individual

    mov x1,x3
    add x1,x1,4
    mov x2,x4

        bl Pasto_individual
        add x1,x1,4
        bl Pasto_individual
        sub x1,x1,2
        sub x2,x2,4
        bl Pasto_individual

    ldr x30,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ret
