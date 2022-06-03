.section .text

// ------------------------------------------- Fogata ------------------------------------------ 

.globl Fogata
Fogata:
// Argumentos: (x1,x2) y (x3,x4) --> largo de la fogata. El eje y en ambos puntos debe ser igual.

    str x0,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x13,[sp,-8]!
    str x14,[sp,-8]!
    str x15,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x16,[sp,-8]!
    str x21,[sp,-8]!
    str x22,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    
    // Primero se hace la pila de troncos. Son 3 troncos.
    // Se comienza por el que está detrás de todos.

    // Guardo valores por si necesito hacer cálculos auxiliares.
    mov x11, x1
    mov x12, x2
    mov x13, x3
    mov x14, x4
    sub x15,x3,x1

    ldr x0, =0x3E2631

    // El ancho del tronco será un cuarto de la longitud. O sea, la longitud dividida por 4 (un lsr 2)
    // Primer tronquito
    
    sub x5,x3,x1
    lsr x5,x5,2
    add x4,x4,x5

    bl Pinta_rectangulo

    ldr x0, =0xD77645

    mov x3,x1
    sub x6,x4,x2
    mov x3,x1
    add x3,x3,x6

    mov x11,x1
    bl Pinta_rectangulo

    sub x6,x3,x1 //Longitud de la parte amarilla
    lsr x6,x6,1
    //Segundo tronquito. El segundo tronquito es simplemente restar a x1 y x3 constantes (o sumar) 

    sub x1,x1,x6
    sub x3,x3,x6   
    sub x1,x1,x6
    sub x3,x3,x6  
    sub x1,x1,x6
    sub x3,x3,x6   

    mov x8,x1

    bl Pinta_rectangulo

    ldr x0, =0x733F3C

    mov x1,x3
    add x1,x1,x6

    bl Pinta_rectangulo

    ldr x0, =0xE5A773

    sub x7,x4,x2 // Acá x7 es el alto de un tronco entero
    lsr x7,x7,1  // Acá x7 es la mitad del alto de un tronco entero


    sub x2,x2,x7
    sub x4,x4,x7
    mov x1,x8
    add x1,x1,x6

    add x3,x3,x6
    bl Pinta_rectangulo

    ldr x0, =0xBD4B2D

    sub x4,x4,x7
    mov x1,x3
    add x1,x1,1
    lsl x5,x5,2
    add x3,x3,x5

    bl Pinta_rectangulo

    ldr x0, =0xF37622

    lsl x6,x6,1 // x6 acá es la longitud de la parte amarilla de un tronquito, lo que está en la punta.
    sub x3,x3,x6
    lsl x6,x6,1
    sub x2,x2,x6
    sub x4,x4,x7
    sub x10,x3,x1

    mov x11,x1
    mov x15,x2
    mov x13,x3
    mov x16,x4

    bl Pinta_rectangulo

    ldr x0, =0xFAE760
    sub x7,x3,x1 
    lsr x7,x7,2
    mov x9,x7
    add x1,x1,x7
    mov x3,x1
    lsr x7,x7,1
    add x3,x3,x7
    add x2,x2,x7

    mov x21,x1
    mov x22,x2
    mov x23,x3
    mov x24,x4

    bl Pinta_rectangulo

    ldr x0, =0xFAE760

    lsl x9,x9,1
    add x1,x1,x9
    add x3,x3,x9 
    add x2,x2,x7

    bl Pinta_rectangulo

    ldr x0, =0xFBAD34
    sub x9,x3,x1
    sub x3,x3,x9
    sub x3,x3,x9

    bl Pinta_rectangulo

    ldr x0, =0xFBAD34

    add x3,x3,x9
    add x3,x3,x9
    add x1,x1,x9
    add x1,x1,x9

    bl Pinta_rectangulo

    ldr x0, =0xFBAD34

    sub x3,x3,x9
    sub x1,x1,x9
    sub x9,x4,x2
    lsr x9,x9,2
    sub x2,x2,x9
    lsl x9,x9,2
    sub x4,x4,x9


    
    bl Pinta_rectangulo

    ldr x0, =0xFBAD34
    mov x1,x21
    mov x2,x22
    mov x3,x23
    mov x4,x24

    lsr x9,x9,2
    sub x1,x1,x9
    sub x3,x3,x9

    mov x12,x2
    mov x14,x4

    bl Pinta_rectangulo

    mov x1,x21
    mov x2,x22
    mov x3,x23
    mov x4,x24
    add x1,x1,x9
    add x3,x3,x9

    bl Pinta_rectangulo

    mov x1,x21
    mov x2,x22
    mov x3,x23
    mov x4,x24
    sub x2,x2,x9
    sub x4,x4,x9


    bl Pinta_rectangulo

    ldr x0, =0xFAE760

    mov x2,x12
    mov x4,x14

    bl Pinta_rectangulo

    ldr x0, =0xF37623

    mov x1,x11
    mov x3,x13
    mov x2,x15
    mov x4,x2
    sub x4,x4,x9
    add x1,x1,x9
    mov x3,x1
    lsl x9,x9,1
    add x3,x3,x9
    lsr x9,x9,1
    add x3,x3,x9

    bl Pinta_rectangulo

    ldr x0, =0xF37623

    sub x2,x2,x9
    sub x4,x4,x9
    add x1,x1,x9
    sub x3,x3,x9
    bl Pinta_rectangulo

    ldr x0, =0xF37623
    lsl x9,x9,2
    add x1,x1,x9
    add x3,x3,x9
    lsr x9,x9,2
    add x4,x4,x9
    add x2,x2,x9
    


    bl Pinta_rectangulo

    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x22,[sp],8
    ldr x21,[sp],8
    ldr x16,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x15,[sp],8
    ldr x14,[sp],8
    ldr x13,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8

    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x0,[sp],8

    ret
