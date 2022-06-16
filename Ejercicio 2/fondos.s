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
.equ NUBE_BLANCO, 0xF5F5F3
.equ NUBE_GRIS, 0xB9D9E8

.section .text

// ------------------------------------------- MONTAÑAS ------------------------------------------

.globl Montanas
Montanas:
    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x30,[sp,-8]!

// Siluetas de fondo
    ldr x0,=0xA35F49
    mov x1,30
    mov x2,175
    mov x3,180
    mov x4,175
    mov x5,108
    mov x6,47
    bl Pinta_triangulo

    ldr x0,=0xA35F49
    mov x1,155
    mov x2,207
    mov x3,260
    mov x4,207
    mov x5,209
    mov x6,132
    bl Pinta_triangulo

    ldr x0,=0xA35F49
    mov x1,412
    mov x2,215
    mov x3,555
    mov x4,215
    mov x5,483
    mov x6,106
    bl Pinta_triangulo

    ldr x0,=0xA35F49
    mov x1,568
    mov x2,180
    mov x3,698
    mov x4,181
    mov x5,633
    mov x6,60
    bl Pinta_triangulo


// 1era montaña

    // 1er lado
    ldr x0,=0x5d4037
    mov x1,150
    mov x2,210
    mov x3,134
    mov x4,223
    mov x5,44
    mov x6,27
    bl Pinta_triangulo

    // 2do lado
    ldr x0,=0x523830
    mov x1,42
    mov x2,240
    bl Pinta_triangulo

    // 3er lado
    ldr x0,=0x4e342e
    mov x3,-50
    mov x4,223
    bl Pinta_triangulo

    // 4to lado
    ldr x0,=0x3e2723
    mov x1,-66
    mov x2,210
    bl Pinta_triangulo

    // Montaña detrás
    ldr x0,=0x3e2723
    mov x1,185
    mov x2,223
    mov x3,198
    mov x4,229
    mov x5,243
    mov x6,128
    bl Pinta_triangulo

   ldr x0,=0x4e342e
    mov x1,243
    mov x2,235
    bl Pinta_triangulo

    ldr x0,=0x523830
    mov x3,288
    mov x4,229
    bl Pinta_triangulo

    ldr x0,=0x5d4037
    mov x1,298
    mov x2,223
    bl Pinta_triangulo

// 2da montaña
    // Fondo
    ldr x0,=0x3e2723
    mov x1,62
    mov x2,237
    mov x3,226
    mov x4,237
    mov x5,144
    mov x6,68
    bl Pinta_triangulo

    // Primer lado
    ldr x0,=0x3e2723
    mov x3,69
    mov x4,256
    bl Pinta_triangulo

    // Segundo lado
    ldr x0,=0x4e342e
    mov x1,x3
    mov x2,x4
    mov x3,144
    mov x4,265
    bl Pinta_triangulo

    // Tercer lado
    ldr x0,=0x523830
    mov x1,x3
    mov x2,x4
    mov x3,219
    mov x4,255
    bl Pinta_triangulo

    // Cuarto lado
    ldr x0,=0x5d4037
    mov x1,x3
    mov x2,x4
    mov x3,226
    mov x4,237
    bl Pinta_triangulo

// Lado derecho M1

    ldr x0,=0x5d4037
    mov x1,472
    mov x2,222
    mov x3,489
    mov x4,238
    mov x5,577
    mov x6,38
    bl Pinta_triangulo

    ldr x0,=0x523830
    mov x1,577
    mov x2,246
    bl Pinta_triangulo

    ldr x0,=0x4e342e
    mov x3,665
    mov x4,238
    bl Pinta_triangulo

    ldr x0,=0x3e2723
    mov x1,682
    mov x2,222
    bl Pinta_triangulo

// M2

    ldr x0,=0x5d4037
    mov x1,382
    mov x2,223
    mov x3,391
    mov x4,233
    mov x5,430
    mov x6,119
    bl Pinta_triangulo

    ldr x0,=0x523830
    mov x1,430
    mov x2,242
    bl Pinta_triangulo

    ldr x0,=0x4e342e
    mov x3,468
    mov x4,234
    bl Pinta_triangulo

    ldr x0,=0x3e2723
    mov x1,477
    mov x2,223
    bl Pinta_triangulo



// Lado derecho M3
    ldr x0,=0x5d4037
    mov x1,435
    mov x2,246
    mov x3,442
    mov x4,254
    mov x5,487
    mov x6,141
    bl Pinta_triangulo

    ldr x0,=0x523830
    mov x1,487
    mov x2,263
    bl Pinta_triangulo

    ldr x0,=0x4e342e
    mov x3,532
    mov x4,254
    bl Pinta_triangulo

    ldr x0,=0x3e2723
    mov x1,539
    mov x2,246
    bl Pinta_triangulo

    ldr x30,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

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
    str x21,[sp,-8]!
    str x30,[sp,-8]!

        ldr x0,=AMARILLO
		mov x3,50
		mov x25,-3
        mov x24,0
        mov x23,0
        mov x21,0
		bl Pinta_circulo

    ldr x30,[sp],8
    ldr x21,[sp],8
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
    
    // ------------------------------------------- NUBES ------------------------------------------
    
    .globl Nube1
Nube1:
// Argumentos: 1 punto (x1,x2)

    centrox .req x1
    centroy .req x2
    radio .req x3

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x30,[sp,-8]!

    mov x11,centrox
    mov x12,centroy

    ldr x0,=NUBE_BLANCO
    mov radio,8
    bl Pinta_circulo

    ldr x0,=NUBE_GRIS
    mov radio,13
    add centroy,centroy,15
    sub centrox,centrox,15
    bl Pinta_circulo

    mov x4, 8 // Contador para el ciclo
    Nube_circulos_grises:
        // Ciclo para hacer la base
        add centrox,centrox,5
        bl Pinta_circulo
        sub x4,x4,1
        cmp x4,0
        b.ne Nube_circulos_grises

    ldr x0,=NUBE_BLANCO
    mov radio,8
    add centrox,centrox,5
    bl Pinta_circulo

    sub centroy,centroy,3
    bl Pinta_circulo
    sub centroy,centroy,2
    sub centrox,centrox,3
    bl Pinta_circulo
    sub centrox,centrox,2
    add centroy,centroy,5

    mov radio,10
    ldr x0,=NUBE_BLANCO

    mov centroy,x12
    add centroy,centroy,5
    sub centrox,centrox,10
    bl Pinta_circulo   
    sub centrox,centrox,5
    bl Pinta_circulo 
    sub centrox,centrox,5
    bl Pinta_circulo 
    sub centrox,centrox,5
    mov radio, 15
    add centroy,centroy,3
    bl Pinta_circulo 
    sub centroy,centroy,3
    sub centrox,centrox,5
    add centroy,centroy,5
    mov radio, 10
    bl Pinta_circulo 
    sub centrox,centrox,10
    mov radio, 10
    bl Pinta_circulo 

    .unreq centrox
    .unreq centroy
    .unreq radio

    ldr x30,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret
    
    .globl Nube2
Nube2:
// Argumentos: 1 punto (x1,x2)

    centrox .req x1
    centroy .req x2
    radio .req x3

    str x0,[sp,-8]!
    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x11,[sp,-8]!
    str x12,[sp,-8]!
    str x30,[sp,-8]!

    mov x11,centrox
    mov x12,centroy

    ldr x0,=NUBE_BLANCO
    mov radio,6
    add centroy,centroy,4
    bl Pinta_circulo
    sub centroy,centroy,4

    ldr x0,=NUBE_GRIS
    mov radio,11
    add centroy,centroy,13
    sub centrox,centrox,13
    bl Pinta_circulo

    mov x4, 8 // Contador para el ciclo
    Nube_circulos_grises_2:
        // Ciclo para hacer la base
        add centrox,centrox,3
        bl Pinta_circulo
        sub x4,x4,1
        cmp x4,0
        b.ne Nube_circulos_grises_2

    ldr x0,=NUBE_BLANCO
    mov radio,6
    add centrox,centrox,6
    bl Pinta_circulo

    sub centroy,centroy,3
    bl Pinta_circulo
    
    sub centroy,centroy,1
    sub centrox,centrox,5
    bl Pinta_circulo

    sub centroy,centroy,4
    sub centrox,centrox,5
    bl Pinta_circulo

    add centroy,centroy,4
    mov radio, 10
    sub centrox,centrox,8
    bl Pinta_circulo

    mov radio, 8
    sub centrox,centrox,12
    bl Pinta_circulo

    .unreq centrox
    .unreq centroy
    .unreq radio

    ldr x30,[sp],8
    ldr x12,[sp],8
    ldr x11,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ldr x0,[sp],8

    ret

.globl ConjuntoNubes
ConjuntoNubes:
// Argumentos: 1 punto (x1,x2)

    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x21,[sp,-8]!
    str x30,[sp,-8]!

    mov x21,1 //para que me lo deje dentro del framebuffer

    bl Nube1

    add x2,x2,20
    add x1,x1,80
    bl Nube2

    ldr x30,[sp],8
    ldr x21,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8
    ret




