pinta_punto:
    // x0 --> color
    // (x9,10) --> punto a pintar
    sub sp,sp,8
    str x12,[sp]

    madd x12,x10,x19,x9
    lsl x12,x12,2
    add x12,x12,x29

    str w0,[x12]

    ldr x12,[sp]
    add sp,sp,8
    ret



.globl pinta_linea
pinta_linea:
    // x0 --> color
    // (x1,x2) - (x3,x4) extremos (distintos) de la linea de modo que x2 <= x4
    cmp x1,x3
    b.eq pinta_linea_vertical
    b pinta_linea_general
    pinta_linea_end:
        ret

pinta_linea_vertical:
    // x10 para iterar en el intervalo [x2,x4]
    mov x9,x1
    mov x10,x2
    pinta_linea_vertical_for_x10:
        bl pinta_punto
        cmp x10,x4
        b.eq pinta_linea_end
        add x10,x10,1
        b pinta_linea_vertical_for_x10

pinta_linea_general:
    //
    //
    //
    //
    //
    //COMPLETAR ESTE CASO
    //
    //
    //
    //
    //
    b pinta_linea_end
