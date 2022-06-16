   
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
