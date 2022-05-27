.section .text
// ------------------------------------------- PINTA PUNTO ------------------------------------------

Pinta_punto:
    // x0 --> color
    // (x9,10) --> punto a pintar
    inicio_framebuffer .req x29
    ancho_framebuffer .req x19
	largo_framebuffer .req x20
    color .req w0
    x .req x9
    y .req x10
    pixel .req x12

    // Verifico que esté dentro del FrameBuffer
    cmp x,0
    b.lt pinta_punto_fuera_de_limites // x < 0
    cmp y,0
    b.lt pinta_punto_fuera_de_limites // y < 0
    cmp ancho_framebuffer,x
    b.lt pinta_punto_fuera_de_limites // x > Ancho FrameBuffer
    cmp largo_framebuffer,y
    b.lt pinta_punto_fuera_de_limites // y > Largo FrameBuffer

    str pixel,[sp,-8]!

    sub y,largo_framebuffer,y   // Porque nos gusta trabajar con el eje cartesiano de siempre

    madd pixel,y,ancho_framebuffer,x
    lsl pixel,pixel,2
    add pixel,pixel,inicio_framebuffer

    str color,[pixel]

    ldr pixel,[sp],8
    pinta_punto_fuera_de_limites:
        .unreq inicio_framebuffer
        .unreq largo_framebuffer
        .unreq ancho_framebuffer
        .unreq color
        .unreq x
        .unreq y
        .unreq pixel
        ret


// ------------------------------------------- ITERA LINEA ------------------------------------------

.equ FIN_ITERACION,0xfff

.globl Itera_linea  // Algoritmo de Bresenham
Itera_linea:
    // x0 -> color
    // (x1,x2) y (x3,x4) extremos de la línea
        // (x1,x2) = (xa,ya)
        // (x3,x4) = (xb,yb)

    // Renombro por comodidad
        xa .req x1
        xb .req x3
        ya .req x2
        yb .req x4
        dx .req x5
        dy .req x6
        sx .req x7
        sy .req x8
        xpixel .req x9
        ypixel .req x10
        absdx .req x11
        absdy .req x12
        aux .req x13
        p .req x14
        it .req x15
        isswaped .req x16
        retorno .req x27

    // Guardo todo en el stack
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
        str x27,[sp,-8]!
        
    mov retorno,x30
    mov x26,0

    // Busco delta
        sub dx,xb,xa
        sub dy,yb,ya

        mov absdx,dx
        mov absdy,dy
    
    // Busco signos
        mov sx,1
        mov sy,1

        // if dx < 0, es sx = -1
            cmp dx,0
            b.ge Itera_linea_neg_sx
                mov sx,-1
                sub absdx,xzr,absdx
            Itera_linea_neg_sx:
        
        // if dy < 0, es sy = -1
            cmp dy,0
            b.ge Itera_linea_neg_sy
                mov sy,-1
                sub absdy,xzr,absdy
            Itera_linea_neg_sy:
    
    // Flag para saber si hice swap
        mov isswaped,0
    // if abs(dy) > abs(dx)
        cmp absdy,absdx
        b.le Itera_linea_swapping
            mov aux,dx
            mov dx,dy
            mov dy,aux

            mov aux,absdx
            mov absdx,absdy
            mov absdy,aux

            mov isswaped,1
        Itera_linea_swapping:
    
    // Parámetro de decisión
        lsl p,absdy,1
        sub p,p,absdx
    
    // Pinto el primer punto
        mov xpixel,xa
        mov ypixel,ya

        blr retorno     // devuelvo el punto obtenido

    // for i=0 to absdx
        mov it,0
        Itera_linea_while:
            // it <= absdx
                cmp it,absdx
                b.gt Itera_linea_while_end
            
            // if p < 0
                cmp p,0
                b.ge Itera_linea_while_p_pos
                    // then
                    // if isswaped == 0
                        cmp isswaped,0
                        b.ne Itera_linea_while_isswaped_true
                            // then
                            add xa,xa,sx
                            b Itera_linea_while_isswaped_end
                        Itera_linea_while_isswaped_true:
                            // else
                            add ya,ya,sy
                        Itera_linea_while_isswaped_end:
                    // end if
                    mov xpixel,xa
                    mov ypixel,ya

                        blr retorno     // devuelvo el punto obtenido
                        
                    add p,p,absdy,lsl 1
                    b Itera_linea_while_p_end

                Itera_linea_while_p_pos:
                    // else
                    add xa,xa,sx
                    add ya,ya,sy
                    mov xpixel,xa
                    mov ypixel,ya

                        blr retorno     // devuelvo el punto obtenido
                        
                    add p,p,absdy,lsl 1
                    sub p,p,absdx,lsl 1
            Itera_linea_while_p_end:
            
            // Siguiente iteracion
            add it,it,1
            b Itera_linea_while
        Itera_linea_while_end:
    
    // Elimino los renombres

        .unreq xa
        .unreq xb
        .unreq ya
        .unreq yb
        .unreq dx
        .unreq dy
        .unreq sx
        .unreq sy
        .unreq xpixel
        .unreq ypixel
        .unreq absdx
        .unreq absdy
        .unreq aux
        .unreq p
        .unreq it
        .unreq isswaped
        .unreq retorno
    
    // Saco todo del stack
        ldr x27,[sp],8
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
    
        mov x26,FIN_ITERACION

    ret


// ------------------------------------------- PINTA LINEA ------------------------------------------

.globl Pinta_linea
Pinta_linea:
    // x0 -> color
    // (x1,x2) y (x3,x4) extremos
    str x26,[sp,-8]!
    str x30,[sp,-8]!
    
    bl Itera_linea

    // if x26 == FIN_ITERACION
    cmp x26,FIN_ITERACION
    b.eq Pinta_linea_fin_iteracion
        // else
        str x30,[sp,-8]!
        bl Pinta_punto
        ldr x30,[sp],8

        ret     // para que me itere al siguiente punto

    Pinta_linea_fin_iteracion:

    ldr x30,[sp],8
    ldr x26,[sp],8

    ret


// ------------------------------------------- PINTA TRIANGULO ------------------------------------------

.globl Pinta_triangulo
Pinta_triangulo:
    // x0 -> color
    // (x1,x2), (x3,x4) y (x5,x6) extremos
        // x17 y x18 para aux
    
    str x17,[sp,-8]!
    str x18,[sp,-8]!
    str x26,[sp,-8]!
    str x30,[sp,-8]!

    xx5 .req x17
    xx6 .req x18

    mov xx5,x5
    mov xx6,x6
    
    bl Itera_linea

    // if x26 == FIN_ITERACION
    cmp x26,FIN_ITERACION
    b.eq Pinta_triangulo_fin_iteracion
        // else
        str x30,[sp,-8]!
        str x1,[sp,-8]!
        str x2,[sp,-8]!
        str x3,[sp,-8]!
        str x4,[sp,-8]!

            mov x1,xx5
            mov x2,xx6
            mov x3,x9
            mov x4,x10

            bl Pinta_linea

        ldr x4,[sp],8
        ldr x3,[sp],8
        ldr x2,[sp],8
        ldr x1,[sp],8
        ldr x30,[sp],8
        ret     // para que me itere al siguiente punto

    Pinta_triangulo_fin_iteracion:

    ldr x30,[sp],8
    ldr x26,[sp],8
    ldr x18,[sp],8
    ldr x17,[sp],8

    .unreq xx5
    .unreq xx6
    ret


// ------------------------------------------- PINTA CUADRILATERO ------------------------------------------

.globl Pinta_cuadrilatero
Pinta_cuadrilatero:
    // x0 -> color
    // (x1,x2), (x3,x4), (x5,x6) y (x7,x8) extremos

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

    xA .req x1
    yA .req x2
    xB .req x3
    yB .req x4
    xC .req x5
    yC .req x6
    xD .req x7
    yD .req x8
    aux .req x11

        // Extremos A B C
            bl Pinta_triangulo
        
        // Extremos A B D
            // swap C y D
                mov aux,xC
                mov xC,xD
                mov xD,aux

                mov aux,yC
                mov yC,yD
                mov yD,aux
            
            bl Pinta_triangulo

        // Extremos A C D
            // swap B y C (C está en D por el anterior swap)
                mov aux,xB
                mov xB,xD
                mov xD,aux

                mov aux,yB
                mov yB,yD
                mov yD,aux
            
            bl Pinta_triangulo

    .unreq xA
    .unreq yA
    .unreq xB
    .unreq yB
    .unreq xC
    .unreq yC
    .unreq xD
    .unreq yD
    .unreq aux

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

    ret


// ------------------------------------------- DIBUJA CIRCULO ------------------------------------------

Dibuja_circulo_pintanding:
    // (x1,x2) -> centro
    // x5 -> x
    // x6 -> y
    // x19 -> w
    // x20 -> h

    str x9,[sp,-8]!
    str x10,[sp,-8]!
    str x30,[sp,-8]!

    xc .req x1
    yc .req x2
    x .req x5
    y .req x6
    xpixel .req x9
    ypixel .req x10

    mov xpixel,xc
    mov ypixel,yc
    
    // xc + x
        add xpixel,xc,x
        // yc + y
        add ypixel,yc,y
        bl Pinta_punto

        // yc - y
        sub ypixel,yc,y
        bl Pinta_punto
    
    // xc - x
        sub xpixel,xc,x
        // yc + y
        add ypixel,yc,y
        bl Pinta_punto

        // yc - y
        sub ypixel,yc,y
        bl Pinta_punto

    // xc + y
        add xpixel,xc,y
        // yc + x
        add ypixel,yc,x
        bl Pinta_punto

        // yc - x
        sub ypixel,yc,x
        bl Pinta_punto
    
    // xc - y
        sub xpixel,xc,y
        // yc + x
        add ypixel,yc,x
        bl Pinta_punto

        // yc - x
        sub ypixel,yc,x
        bl Pinta_punto

    .unreq xc
    .unreq yc
    .unreq x
    .unreq y
    .unreq xpixel
    .unreq ypixel

    ldr x30,[sp],8
    ldr x10,[sp],8
    ldr x9,[sp],8

    ret


.globl Dibuja_circulo
Dibuja_circulo:              // Algoritmo de Bresenham
    // x0 -> color
    // (x1,x2) -> centro
    // x3 -> radio

    str x1,[sp,-8]!
    str x2,[sp,-8]!
    str x3,[sp,-8]!
    str x4,[sp,-8]!
    str x5,[sp,-8]!
    str x6,[sp,-8]!
    str x7,[sp,-8]!
    str x30,[sp,-8]!

    r .req x3
    d .req x4
    x .req x5
    y .req x6
    aux .req x7
    
    // x = 0, y = r, d = 3 - 2 * r
    mov x,0
    mov y,r
    add d,r,r
    sub d,d,3
    sub d,xzr,d

    // while y >= x
    Dibuja_circulo_while:
        cmp y,x
        b.lt Dibuja_circulo_while_end

        bl Dibuja_circulo_pintanding
        add x,x,1

        // if d > 0
        cmp d,0
        b.le Dibuja_circulo_d_no_positivo
            // then
            sub y,y,1
            // d = d + 4 * (x-y) + 10
            sub aux,x,y
            lsl aux,aux,2
            add d,d,aux
            add d,d,10
            b Dibuja_circulo_d_end

        Dibuja_circulo_d_no_positivo:
            // else
            // d = d + 4 * x + 6
            lsl aux,x,2
            add d,d,aux
            add d,d,6
        
        Dibuja_circulo_d_end:

            bl Dibuja_circulo_pintanding
            b Dibuja_circulo_while

    Dibuja_circulo_while_end:

    .unreq r
    .unreq d
    .unreq x
    .unreq y
    .unreq aux

    ldr x30,[sp],8
    ldr x7,[sp],8
    ldr x6,[sp],8
    ldr x5,[sp],8
    ldr x4,[sp],8
    ldr x3,[sp],8
    ldr x2,[sp],8
    ldr x1,[sp],8

    ret
