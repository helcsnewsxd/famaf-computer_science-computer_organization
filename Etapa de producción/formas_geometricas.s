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


// ------------------------------------------- PINTA LINEA ------------------------------------------

.globl Pinta_linea  // Algoritmo de Bresenham
Pinta_linea:
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
            b.ge Pinta_linea_neg_sx
                mov sx,-1
                sub absdx,xzr,absdx
            Pinta_linea_neg_sx:
        
        // if dy < 0, es sy = -1
            cmp dy,0
            b.ge Pinta_linea_neg_sy
                mov sy,-1
                sub absdy,xzr,absdy
            Pinta_linea_neg_sy:
    
    // Flag para saber si hice swap
        mov isswaped,0
    // if abs(dy) > abs(dx)
        cmp absdy,absdx
        b.le Pinta_linea_swapping
            mov aux,dx
            mov dx,dy
            mov dy,aux

            mov aux,absdx
            mov absdx,absdy
            mov absdy,aux

            mov isswaped,1
        Pinta_linea_swapping:
    
    // Parámetro de decisión
        lsl p,absdy,1
        sub p,p,absdx
    
    // Pinto el primer punto
        mov xpixel,xa
        mov ypixel,ya
        bl Pinta_punto

    // for i=0 to absdx
        mov it,0
        Pinta_linea_while:
            // it <= absdx
                cmp it,absdx
                b.gt Pinta_linea_while_end
            
            // if p < 0
                cmp p,0
                b.ge Pinta_linea_while_p_pos
                    // then
                    // if isswaped == 0
                        cmp isswaped,0
                        b.ne Pinta_linea_while_isswaped_true
                            // then
                            add xa,xa,sx
                            b Pinta_linea_while_isswaped_end
                        Pinta_linea_while_isswaped_true:
                            // else
                            add ya,ya,sy
                        Pinta_linea_while_isswaped_end:
                    // end if
                    mov xpixel,xa
                    mov ypixel,ya
                    bl Pinta_punto
                    add p,p,absdy,lsl 1
                    b Pinta_linea_while_p_end

                Pinta_linea_while_p_pos:
                    // else
                    add xa,xa,sx
                    add ya,ya,sy
                    mov xpixel,xa
                    mov ypixel,ya
                    bl Pinta_punto
                    add p,p,absdy,lsl 1
                    sub p,p,absdx,lsl 1
            Pinta_linea_while_p_end:
            
            // Siguiente iteracion
            add it,it,1
            b Pinta_linea_while
        Pinta_linea_while_end:
    
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
    
    // Saco todo del stack
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
    
    ret


// ------------------------------------------- PROXIMAMENTE ------------------------------------------

