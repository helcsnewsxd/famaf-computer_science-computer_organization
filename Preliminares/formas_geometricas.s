// ------------------------------------------- PINTA PUNTO ------------------------------------------

pinta_punto:
    // x0 --> color
    // (x9,10) --> punto a pintar

    // Verifico que esté dentro del FrameBuffer
    cmp x9,0
    b.lt pinta_punto_fuera_de_limites // x9 < 0
    cmp x10,0
    b.lt pinta_punto_fuera_de_limites // x10 < 0
    cmp x19,x9
    b.lt pinta_punto_fuera_de_limites // x9 > Ancho FrameBuffer
    cmp x20,x10
    b.lt pinta_punto_fuera_de_limites // x10 > Largo FrameBuffer

    sub sp,sp,8
    str x12,[sp]

    madd x12,x10,x19,x9
    lsl x12,x12,2
    add x12,x12,x29

    str w0,[x12]

    ldr x12,[sp]
    add sp,sp,8
    pinta_punto_fuera_de_limites:
        ret

// --------------------------------------------------------------------------------------------------





// ------------------------------------------- ITERA LINEA ------------------------------------------
.equ TERMINAR_ITERACION,0xFFF   // No puede ser un punto dentro del FrameBuffer

itera_linea:
    // (x1,x2) - (x3,x4) extremos (distintos) de la linea
    sub sp,sp,48
    str x30,[sp]
    str x1,[sp,8]
    str x2,[sp,16]
    str x3,[sp,24]
    str x4,[sp,32]
    str x5,[sp,40]

    mov x27,x30 // guardamos el linkeo de la vuelta para poder devolver un punto y calcular el siguiente

    // nos aseguramos que x2 <= x4 por simplicidad
    cmp x2,x4
    b.le itera_linea_no_swapeo_puntos
    mov x5,x1
    mov x1,x3
    mov x3,x5

    mov x5,x2
    mov x2,x4
    mov x4,x5
    itera_linea_no_swapeo_puntos:

    cmp x1,x3
    b.eq itera_linea_vertical
    b itera_linea_general
    itera_linea_end:
        ldr x30,[sp]
        ldr x1,[sp,8]
        ldr x2,[sp,16]
        ldr x3,[sp,24]
        ldr x4,[sp,32]
        ldr x5,[sp,40]
        add sp,sp,48

        mov x9,TERMINAR_ITERACION
        ret

itera_linea_vertical:
    // x10 para iterar en el intervalo [x2,x4]
    mov x9,x1
    mov x10,x2
    itera_linea_vertical_for_x10:
        blr x27 // Le doy el punto (x9,x10) que vale y luego vuelve con branch para seguir iterando
        cmp x10,x4
        b.eq itera_linea_end
        add x10,x10,1
        b itera_linea_vertical_for_x10

itera_linea_general:
    // (x1,x2), (x3,x4) los extremos con x2 <= x4
    // Devuelvo los (x,y) que cumplan abs(g(x) - y(x3-x1)) < abs(x3-x1)
        // donde g(x) = (x4-x2)(x-x1) + x2(x3-x1)
        //       se itera x en [min(x1,x3), max(x1,x3)]
    
    // x5 = x3-x1
    // x6 = x4-x2
    // x7 = g(x) - y(x3-x1)
    // x8 = abs(x3-x1)
    // x11 = min(x1,x3)
    // x12 = max(x1,x3)
    // x13 = x2*x5

    sub sp,sp,56
    str x5,[sp]
    str x6,[sp,8]
    str x7,[sp,16]
    str x8,[sp,24]
    str x11,[sp,32]
    str x12,[sp,40]
    str x13,[sp,48]

    // Seteos correspondientes
    sub x5,x3,x1
    sub x6,x4,x2
    mov x11,x1
    mov x12,x3
    cmp x5,0
    b.ge itera_linea_general_mayor_x3
    mov x11,x3
    mov x12,x1
    itera_linea_general_mayor_x3:
    sub x8,x12,x11
    mul x13,x2,x5

    // Iteración
    sub x9,x11,1
    itera_linea_general_for_x9:
        cmp x9,x12
        b.eq itera_linea_general_end
        add x9,x9,1
        mov x10,x2
        itera_linea_general_for_x10:
            // calculo g(x)
            sub x7,x9,x1
            madd x7,x6,x7,x13
            // calculo g(x) - y(x3-x1)
            msub x7,x10,x5,x7
            // considero el valor absoluto
            cmp x7,0
            b.ge itera_linea_general_for_x10__x7_positivo
            sub x7,xzr,x7
            itera_linea_general_for_x10__x7_positivo:

            // comparo abs(g(x)-y(x3-x1)) < abs(x3-x1)
            cmp x7,x8
            b.ge itera_linea_general_for_x10__no_valido
            
            blr x27 // Le doy el punto (x9,x10) que vale y luego vuelve con branch para seguir iterando

            itera_linea_general_for_x10__no_valido:

            cmp x10,x4
            b.eq itera_linea_general_for_x9
            add x10,x10,1
            b itera_linea_general_for_x10

    itera_linea_general_end:
        ldr x5,[sp]
        ldr x6,[sp,8]
        ldr x7,[sp,16]
        ldr x8,[sp,24]
        ldr x11,[sp,32]
        ldr x12,[sp,40]
        ldr x13,[sp,48]
        add sp,sp,56

        b itera_linea_end

// --------------------------------------------------------------------------------------------------





// ------------------------------------------- PINTA LINEA ------------------------------------------

.globl pinta_linea
pinta_linea:
    // x0 color
    // (x1,x2) y (x3,x4) extremos
    sub sp,sp,8
    str x30,[sp]

    bl itera_linea // comienza a iterar en el segmento y guardo en x30 la dir de la siguiente linea
    sub sp,sp,8
    str x30,[sp]
    
    cmp x9,TERMINAR_ITERACION
    b.eq pinta_linea_end

    bl pinta_punto
    
    ldr x30,[sp]
    add sp,sp,8
    ret
    pinta_linea_end:
        ldr x30,[sp,8]
        add sp,sp,16
        ret

// ------------------------------------------------------------------------------------------------------




// ------------------------------------------- PINTA TRIANGULO ------------------------------------------
.globl pinta_triangulo
pinta_triangulo:
    // x0 color
    // (x1,x2), (x3,x4), (x5,x6) extremos
    sub sp,sp,64
    str x30,[sp]
    str x1,[sp,8]
    str x2,[sp,16]
    str x3,[sp,24]
    str x4,[sp,32]
    str x5,[sp,40]
    str x6,[sp,48]
    str x7,[sp,56] // auxiliar para swapeos

    // Acomodo de modo que x1 != x3
    cmp x1,x3
    b.ne pinta_triangulo_x1_distinto_x3
    mov x7,x3
    mov x3,x5
    mov x5,x7

    mov x7,x4
    mov x4,x6
    mov x6,x7
    pinta_triangulo_x1_distinto_x3:

    // Acomodo de modo que x2 <= x4
    cmp x2,x4
    b.le pinta_triangulo_x2_menor_x4
    mov x7,x3
    mov x3,x1
    mov x1,x7

    mov x7,x4
    mov x4,x2
    mov x2,x7
    pinta_triangulo_x2_menor_x4:

    // Empiezo la iteración en el segmento de extremos (x1,x2) y (x3,x4)
    // Se hace algo similar a la iteración del pinta_linea_general, con los seteos correspondientes

    
    ldr x30,[sp]
    ldr x1,[sp,8]
    ldr x2,[sp,16]
    ldr x3,[sp,24]
    ldr x4,[sp,32]
    ldr x5,[sp,40]
    ldr x6,[sp,48]
    str x7,[sp,56] // auxiliar para swapeos
    add sp,sp,64
    ret
