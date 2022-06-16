.equ BUFFER_COMPLETO, 0x12ca00

.globl Pasar_al_buffer
Pasar_al_buffer:
	str x1,[sp,-8]!
	str x2,[sp,-8]!
	str x30,[sp,-8]!

    mov x1,x29
	ldr x2,=0x4b280
    ldr x3,=BUFFER_COMPLETO
    Pasar_al_buffer_loop:
		cbz x2,Pasar_al_buffer_loop_end
        add x1,x1,x3
        ldr w4,[x1]
        sub x1,x1,x3
        str w4,[x1]
        add x1,x1,4
		sub x2,x2,1
		b Pasar_al_buffer_loop
    Pasar_al_buffer_loop_end:

	ldr x30,[sp],8
	ldr x2,[sp],8
	ldr x1,[sp],8
    ret


.globl Paisaje_completo
Paisaje_completo:
	// x6 --> pos de nube
	// (x1,x2) --> pos de sol

	str x30,[sp,-8]!
	str x6,[sp,-8]!
	str x7,[sp,-8]!
	str x2,[sp,-8]!
	str x1,[sp,-8]!

	mov x7,x2

    bl Dibuja_fondo_amanecer1

	cbnz x8,Paisaje_completo_noche_satelite
		bl Dibuja_sol_amanecer
		b Paisaje_completo_noche_satelite_end
	Paisaje_completo_noche_satelite:
		bl Dibuja_luna
	Paisaje_completo_noche_satelite_end:
	
	bl Dibuja_pasto

	bl Montanas

		// ARBOL
		mov x1,300
		mov x2,400
		bl Pino1

		mov x1,200
		mov x2,400
		bl Pino2

		mov x1,24
		mov x2,241
		bl Pino3

		mov x1,62
		mov x2,251
		mov x3,80
		mov x4,260
		bl Arbusto1

		mov x1,105
		mov x2,269
		bl Pino2

		mov x1,158
		mov x2,253
		mov x3,181
		mov x4,271
		bl Arbusto1
	
		mov x1,147
		mov x2,259
		mov x3,162
		mov x4,270
		bl Arbusto1

		mov x1,201
		mov x2,264
		bl Pino3

		mov x1,273
		mov x2,245
		bl Pino3

		mov x1,574
		mov x2,250
		bl Pino2

		mov x1,471
		mov x2,265
		bl Pino3

		mov x1,405
		mov x2,246
		bl Pino3

		mov x1,380
		mov x2,400
		mov x3,410
		mov x4,400
		bl Fogata

		mov x1,x6
		mov x2,50
		bl ConjuntoNubes

		add x1,x1,300
		mov x2,100
		bl ConjuntoNubes
	
	mov x1,0
	mov x2,0
	mov x3,x19
	mov x4,x20

	cbnz x8,Paisaje_completo_noche
		cmp x7,0
		b.gt Paisaje_completo_end
		bl Oscurecer

		cmp x7,-20
		b.gt Paisaje_completo_end
		bl Oscurecer
		
		cmp x7,-50
		b.gt Paisaje_completo_end
		bl Oscurecer

		b Paisaje_completo_end
	
	Paisaje_completo_noche:
		bl Dibuja_fondo_noche

		bl Oscurecer
		bl Oscurecer
		bl Oscurecer

		cmp x7,180
		b.gt Paisaje_completo_end
		bl Aclarecer

		cmp x7,100
		b.gt Paisaje_completo_end
		bl Aclarecer
		
		cmp x7,-50
		b.gt Paisaje_completo_end
		bl Aclarecer


	Paisaje_completo_end:	
		ldr x1,[sp],8
		ldr x2,[sp],8
		ldr x7,[sp],8
		ldr x6,[sp],8
		ldr x30,[sp],8
		ret

