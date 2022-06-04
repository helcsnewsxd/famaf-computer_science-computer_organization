// Algunos colores
.equ AMARILLO, 0xFFF000
.equ AZUL, 0x051601
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

.globl Dibuja_fondo_amanecer1
Dibuja_fondo_amanecer1:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=NARANJA
        mov x1,0
        mov x2,0
        mov x3,700
        mov x4,250
        mov x25,-1
        mov x24,0
        mov x23,0
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

.globl Dibuja_fondo_amanecer2
Dibuja_fondo_amanecer2:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x22,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=NARANJA
        mov x1,0
        mov x2,0
        mov x3,700
        mov x4,250
        mov x23,0

        ldr x24,=AZUL
        mov x22,1

        mov x25,-1
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x22,[sp],8
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
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=AMARILLO
		mov x1,500
		mov x2,100
		mov x3,50
		mov x25,-3
        mov x24,0
        mov x23,0
		bl Pinta_circulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret


// ACLARAR
.globl Aclarecer
Aclarecer:
    // (x1,x2) y (x3,x4) extremos
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

        mov x23,1
        mov x24,0
        mov x25,0
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
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
    str x22,[sp,-8]!
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=AZUL
        mov x1,0
        mov x2,0
        mov x3,700
        mov x4,250
        mov x23,0

        ldr x24,=NARANJA
        mov x22,-1

        mov x25,1
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
    ldr x22,[sp],8
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
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x23,[sp,-8]!
    str x30,[sp,-8]!
        mov x23,0

        ldr x0,=0xfddfa0
		mov x1,500
		mov x2,100
		mov x3,50
        mov x25,-1
		bl Pinta_circulo

        ldr x0,=AZUL
        mov x1,487
        mov x2,88
        mov x25,0
        bl Pinta_circulo


        // Arreglo el circulo azul
        mov x1,430
        mov x3,550
        mov x2,0
        mov x4,200
        mov x25,1
        ldr x24,=AZUL
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x23,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
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
    // (x1,x2) y (x3,x4) extremos
    str x23,[sp,-8]!
    str x24,[sp,-8]!
    str x25,[sp,-8]!
    str x30,[sp,-8]!

        mov x23,-1
        mov x24,0
        mov x25,0
        bl Pinta_rectangulo

    ldr x30,[sp],8
    ldr x25,[sp],8
    ldr x24,[sp],8
    ldr x23,[sp],8
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

    ldr x0,=0x2d572c
        mov x1,0
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
