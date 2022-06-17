.section .text

// Edificio

.globl Edificio1
Edificio1:

    // Base
    
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
    str x15,[sp,-8]!
    str x16,[sp,-8]!
    str x30,[sp,-8]!

    ldr x0, =0xFFFFFF
    mov x3,x1
    mov x4,x2

    sub x3,x3,66
    sub x4,x4,55

    bl Pinta_rectangulo

    ldr x0, =0x5A5683
    mov x3,x1
    add x3,x3,80
    bl Pinta_rectangulo

    mov x3,x1
    mov x4,x2
    mov x11,x1
    mov x12,x2
    ldr x0,=0x8F98B5
    sub x3,x3,66
    sub x4,x4,7
    sub x2,x2,7
    bl Pinta_rectangulo

    sub x4,x4,7
    sub x2,x2,7
    bl Pinta_rectangulo

    sub x4,x4,7
    sub x2,x2,7
    bl Pinta_rectangulo

    sub x4,x4,7
    sub x2,x2,7
    bl Pinta_rectangulo

    sub x4,x4,7
    sub x2,x2,7
    bl Pinta_rectangulo

    sub x4,x4,7
    sub x2,x2,7
    bl Pinta_rectangulo

    sub x4,x4,7
    sub x2,x2,7
    bl Pinta_rectangulo

    ldr x0,=0x3C3459
    mov x3,x1
    add x3,x3,80
    bl Pinta_rectangulo

    add x4,x4,7
    add x2,x2,7
    bl Pinta_rectangulo

    add x4,x4,7
    add x2,x2,7
    bl Pinta_rectangulo

    add x4,x4,7
    add x2,x2,7
    bl Pinta_rectangulo

    add x4,x4,7
    add x2,x2,7
    bl Pinta_rectangulo

    add x4,x4,7
    add x2,x2,7
    bl Pinta_rectangulo

    add x4,x4,7
    add x2,x2,7
    bl Pinta_rectangulo

    mov x1,x3
    add x2,x2,7
    mov x4,x2
    sub x4,x4,6

    sub x1,x1,12
    sub x3,x3,12

    bl Pinta_rectangulo

    sub x1,x1,50
    sub x3,x3,50

    bl Pinta_rectangulo

    ldr x0,=0x9D9EBB
    sub x1,x1,40
    sub x3,x3,40

    bl Pinta_rectangulo

    sub x2,x2,7
    sub x4,x4,7
    sub x1,x1,30
    sub x3,x3,30

    bl Pinta_rectangulo

    sub x2,x2,14
    sub x4,x4,14
    add x1,x1,15
    add x3,x3,15

    bl Pinta_rectangulo

    sub x2,x2,7
    sub x4,x4,7
    add x1,x1,25
    add x3,x3,25

    bl Pinta_rectangulo

    sub x1,x1,45
    sub x3,x3,45

    bl Pinta_rectangulo

    sub x2,x2,14
    sub x4,x4,14
    add x1,x1,15
    add x3,x3,15

    bl Pinta_rectangulo

    sub x2,x2,7
    sub x4,x4,7
    add x1,x1,30
    add x3,x3,30

    bl Pinta_rectangulo

    ldr x0,=0x3C3459
    add x1,x1,75
    add x3,x3,75

    bl Pinta_rectangulo

    add x2,x2,14
    add x4,x4,14
    sub x1,x1,45
    sub x3,x3,45

    bl Pinta_rectangulo

    add x2,x2,7
    add x4,x4,7
    add x1,x1,35
    add x3,x3,35

    bl Pinta_rectangulo

    add x2,x2,7
    add x4,x4,7
    add x1,x1,20
    add x3,x3,20

    bl Pinta_rectangulo

    sub x1,x1,65
    sub x3,x3,65

    bl Pinta_rectangulo

    add x2,x2,7
    add x4,x4,7
    add x1,x1,30
    add x3,x3,30

    bl Pinta_rectangulo

    // Pilares en esquinas

    ldr x0,=0x552349
    mov x1,x11
    mov x2,x12
    mov x3,x1
    mov x4,x2
    add x3,x3,3
    sub x4,x4,55
    bl Pinta_rectangulo



    ldr x0,=0x94576C
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    add x1,x1,85
    add x3,x3,85
    ldr x0,=0x552349
    bl Pinta_rectangulo
    ldr x0,=0x94576C
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    sub x1,x1,15
    sub x3,x3,15
    add x4,x4,20
    ldr x0,=0x552349
    bl Pinta_rectangulo
    ldr x0,=0x94576C
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    sub x1,x1,20
    sub x3,x3,20
    ldr x0,=0x552349
    bl Pinta_rectangulo
    ldr x0,=0x94576C
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    sub x4,x4,20
    sub x1,x1,98
    sub x3,x3,98
    ldr x0,=0x552349
    bl Pinta_rectangulo
    ldr x0,=0x94576C
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    add x1,x1,25
    add x3,x3,25

    ldr x0,=0x552349
    bl Pinta_rectangulo
    ldr x0,=0x94576C
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    add x1,x1,85
    add x3,x3,85
    sub x2,x2,35

    add x4,x4,15

    ldr x0,=0x552349
    bl Pinta_rectangulo
    ldr x0,=0x94576C
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    mov x11,x1
    mov x12,x2
    mov x13,x3
    mov x14,x4

    ldr x0,=0x552349
    mov x1,x3
    add x1,x1,1
    add x3,x3,28
    bl Pinta_rectangulo

    // Oscuridad puerta

    ldr x0,=0x0D032E
    mov x1,x11
    mov x2,x12
    mov x3,x13
    mov x4,x14
    add x3,x3,14
    add x1,x1,8
    add x2,x2,35
    add x4,x4,4
    bl Pinta_rectangulo

    ldr x0,=0x9193BA

    mov x1,x3
    add x1,x1,1

    add x3,x3,10
    bl Pinta_rectangulo

    ldr x0,=0x502953
    add x4,x4,20
    sub x2,x2,12
    bl Pinta_rectangulo

    // Techo

    ldr x0,=0x855F6A
    mov x1,x11
    mov x2,x12
    mov x3,x13
    mov x4,x14
    add x1,x1,2

    sub x1,x1,104
    sub x3,x3,34
    sub x4,x4,20
    sub x2,x2,20
    bl Pinta_rectangulo

    ldr x0,=0x4E284F
    add x2,x2,6
    add x4,x4,6
    add x1,x1,68
    add x3,x3,88
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    sub x2,x2,6
    sub x4,x4,6
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    sub x2,x2,6
    sub x4,x4,6
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    sub x2,x2,6
    sub x4,x4,6
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    sub x2,x2,6
    sub x4,x4,6
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    sub x2,x2,6
    sub x4,x4,6
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    sub x2,x2,6
    sub x4,x4,6
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    sub x2,x2,6
    sub x4,x4,6
    bl Pinta_rectangulo


    ldr x0,=0xD2978A
    mov x3,x1
    sub x3,x3,4
    bl Pinta_rectangulo

    mov x11,x1
    mov x12,x2
    mov x13,x3
    mov x14,x4

    add x1,x1,2
    add x3,x3,2
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    add x1,x1,2
    add x3,x3,2
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    add x1,x1,2
    add x3,x3,2
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    add x1,x1,2
    add x3,x3,2
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    add x1,x1,2
    add x3,x3,2
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    add x1,x1,2
    add x3,x3,2
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    add x1,x1,2
    add x3,x3,2
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    mov x1,x11
    mov x2,x12
    mov x3,x13
    mov x4,x14

    add x3,x3,10
    sub x1,x1,55
    sub x2,x2,2
    bl Pinta_rectangulo
    add x2,x2,2
    add x1,x1,15

    mov x3,x1
    add x3,x3,4

    mov x11,x1
    mov x12,x2
    mov x13,x3
    mov x14,x4

    sub x1,x1,5
    sub x3,x3,5

    ldr x0,=0x4E284F

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    ldr x0,=0xD2978A
    sub x1,x1,4
    sub x3,x3,4
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo
    
    mov x1,x11
    mov x2,x12
    mov x3,x13
    mov x4,x14
    sub x1,x1,10
    bl Pinta_rectangulo

    ldr x0,=0xFDFFFF
    add x1,x1,8
    add x3,x3,33
    add x2,x2,6
    add x4,x4,6
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo
    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo
    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo
    add x2,x2,6
    add x4,x4,6
    sub x1,x1,2
    add x3,x3,2
    bl Pinta_rectangulo

    ldr x0,=0x9493B5
    sub x2,x2,5
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    sub x2,x2,6
    sub x4,x4,6
    add x1,x1,2
    sub x3,x3,2
    bl Pinta_rectangulo

    // Rectas verticales de los ladrillos

    add x1,x1,10
    mov x3,x1
    add x4,x4,6
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    add x1,x1,20
    add x3,x3,20
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    sub x1,x1,27
    sub x3,x3,27
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    add x1,x1,15
    add x3,x3,15
    bl Pinta_rectangulo

    add x2,x2,6
    add x4,x4,6
    add x1,x1,20
    add x3,x3,20
    bl Pinta_rectangulo

    sub x1,x1,40
    sub x3,x3,40
    bl Pinta_rectangulo

    ldr x0,=0x080028
    mov x1,x11
    mov x2,x12
    mov x3,x13
    mov x4,x14
    add x4,x4,4
    sub x1,x1,10
    add x3,x3,127
    bl Pinta_rectangulo

    ldr x0,=0xF6F9F9
    add x1,x1,67
    sub x3,x3,55
    sub x4,x4,4

    sub x4,x4,6
    sub x2,x2,6
    bl Pinta_rectangulo

    ldr x0,=0x554E78
    add x1,x1,10
    bl Pinta_rectangulo

    sub x4,x4,4
    sub x2,x2,4
    bl Pinta_rectangulo
    sub x3,x3,8
    sub x1,x1,10
    ldr x0,=0xF6F9F9
    bl Pinta_rectangulo

    // Ventanas



    


    ldr x30,[sp],8
    ldr x16,[sp],8
    ldr x15,[sp],8
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

// Ventanas simples

.globl Ventanas
Ventanas:

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x30,[sp,-8]!

    ldr x0,=0xDDA190
    mov x3,x1
    mov x4,x2
    sub x1,x1,10
    add x3,x3,10
    sub x4,x4,10
    add x2,x2,10
    bl Pinta_rectangulo

    ldr x0,=0x0A0433
    add x1,x1,2
    sub x3,x3,2
    add x4,x4,2
    sub x2,x2,2
    bl Pinta_rectangulo

    ldr x0,=0x5B557D
    sub x3,x3,12
    bl Pinta_rectangulo

    ldr x0,=0xDDA190
    add x3,x3,12
    add x4,x4,9
    mov x2,x4
    add x2,x2,1
    bl Pinta_rectangulo

    mov x3,x1
    add x3,x3,1
    add x2,x2,6

    add x1,x1,4
    add x3,x3,4
    bl Pinta_rectangulo

    add x1,x1,7
    add x3,x3,7
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

// Macetas

.globl Macetas
Macetas:

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x13,[sp,-8]!
    str x14,[sp,-8]!
    str x30,[sp,-8]!

    mov x3,x1
    mov x4,x2

    ldr x0,=0x915B6B
    sub x1,x1,12
    add x3,x3,12
    sub x4,x4,4
    bl Pinta_rectangulo

    ldr x0,=0x2B1327
    sub x4,x4,2
    sub x2,x2,4
    bl Pinta_rectangulo

    ldr x0,=0x915B6B
    sub x2,x2,2
    sub x4,x4,4
    add x3,x3,2
    sub x1,x1,2
    bl Pinta_rectangulo

    mov x11,x1
    mov x12,x2
    mov x13,x3
    mov x14,x4

    ldr x0,=0x54244B
    add x1,x1,22
    bl Pinta_rectangulo

    sub x1,x1,2
    sub x3,x3,2
    add x2,x2,6
    add x4,x4,7
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x14,[sp],8
    ldr x13,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

// ------------------------------------------- Carpa ------------------------------------------ 

.globl Carpa
Carpa:
// Argumentos: (x1,x2), (x3,x4) y (x5,x6) extremos

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!

    mov x9,x1
    sub x8,x3,x1
    add x1,x1,x8
    add x3,x3,x8
    add x5,x5,x8
    ldr x0,=0xD77744
    bl Pinta_triangulo

Rellena_back_carpa:
    sub x1,x1,1
    sub x3,x3,1
    sub x5,x5,1
    bl Pinta_triangulo
    cmp x1,x9
    b.ne Rellena_back_carpa

    ldr x0,=0xB36338
    bl Pinta_triangulo

    // En este punto, mis x1,x2,x3,x4,x5,x6 son los originales. Ahora, yo quiero los mismos puntos pero mas chicos, para hacer la puerta de la carpa
    // PUERTITA
    
    // Las coordenadas de la puertita van a ser (x11,x12) (x13,x14) (x15,x16)
    ldr x0,=0x3C4368
    sub x8,x3,x1
    lsr x8,x8,2
    add x1,x1,x8
    sub x3,x3,x8

    lsl x8,x8,1
    add x6,x6,x8
    bl Pinta_triangulo

    // Ahora, quiero hacer el sombreado. Es la misma fórmula, nada mas que el x1 es igual al x5
    ldr x0,=0x1F2236
    mov x1,x5
    bl Pinta_triangulo



    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret



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
