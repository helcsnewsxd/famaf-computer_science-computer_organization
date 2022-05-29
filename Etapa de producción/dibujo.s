.section .text
// ------------------------------------------- CONSTRUYE EDIFICIO ------------------------------------------
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

    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8

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
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x11,[sp,-8]!
    str x30,[sp,-8]!

    bl Pinta_cuadrilatero

    ldr x30,[sp],8
    ldr x11,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8


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
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x11,[sp,-8]!
    str x30,[sp,-8]!

    bl Pinta_cuadrilatero

    ldr x30,[sp],8
    ldr x11,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    
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
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    // Llamo a pinta rectangulo
    bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8
    ldr x8,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8

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
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x8,[sp,-8]!
    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

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
