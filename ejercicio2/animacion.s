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

Pasar_al_buffer_el_paisaje_delante:
	str x1,[sp,-8]!
	str x2,[sp,-8]!
	str x30,[sp,-8]!

    mov x1,x29
	ldr x2,=0x4b280
    ldr x3,=BUFFER_COMPLETO
	add x1,x1,x3
    Pasar_al_buffer_el_paisaje_delante_loop:
		cbz x2,Pasar_al_buffer_el_paisaje_delante_loop_end
        add x1,x1,x3
        ldr w4,[x1]
        sub x1,x1,x3
		
		cbz w4,Pasar_al_buffer_el_paisaje_delante_negro
        	str w4,[x1]
		Pasar_al_buffer_el_paisaje_delante_negro:
        add x1,x1,4
		sub x2,x2,1
		b Pasar_al_buffer_el_paisaje_delante_loop
    Pasar_al_buffer_el_paisaje_delante_loop_end:

	ldr x30,[sp],8
	ldr x2,[sp],8
	ldr x1,[sp],8
    ret


Oscuridad_o_claridad_prebuffer:
	str x30,[sp,-8]!
	str x29,[sp,-8]!
	str x8,[sp,-8]!
	str x7,[sp,-8]!
	str x6,[sp,-8]!

	mov x6,x8

	ldr x8,=0x12ca00
	add x29,x29,x8
	mov x1,0
	mov x2,0
	mov x3,x19
	mov x4,x20
	
	cbz x6,Oscuridad_o_claridad_prebuffer_dia
		// noche
		cmp x7,180
		b.eq Oscuridad_o_claridad_prebuffer_aclarecer
		cmp x7,100
		b.eq Oscuridad_o_claridad_prebuffer_aclarecer
		cmp x7,-60
		b.eq Oscuridad_o_claridad_prebuffer_aclarecer
		b Oscuridad_o_claridad_prebuffer_end
	Oscuridad_o_claridad_prebuffer_dia:
		// dia
		cmp x7,0
		b.eq Oscuridad_o_claridad_prebuffer_oscurecer
		cmp x7,-20
		b.eq Oscuridad_o_claridad_prebuffer_oscurecer
		b Oscuridad_o_claridad_prebuffer_end

	Oscuridad_o_claridad_prebuffer_oscurecer:
		bl Oscurecer
		b Oscuridad_o_claridad_prebuffer_end
	Oscuridad_o_claridad_prebuffer_aclarecer:
		bl Aclarecer
	
	Oscuridad_o_claridad_prebuffer_end:
		ldr x6,[sp],8
		ldr x7,[sp],8
		ldr x8,[sp],8
		ldr x29,[sp],8
		ldr x30,[sp],8
		ret

.globl Paisaje_capa_delante
Paisaje_capa_delante:
	str x30,[sp,-8]!
	str x29,[sp,-8]!
	str x8,[sp,-8]!
	str x7,[sp,-8]!

	mov x7,x8

	ldr x8,=0x12ca00
	add x29,x29,x8

	mov x0,0
	mov x1,0
	mov x2,0
	mov x3,x19
	mov x4,x20
	bl Pinta_rectangulo

	bl Dibuja_pasto

	bl Montanas

	// Resto de vegetacion

			// Chiquitos del fondo

				// izquierda
				mov x1,272
				mov x2,221
				mov x3,290
				mov x4,230
				bl Arbusto1

				mov x1,242
				mov x2,231
				mov x3,260
				mov x4,240
				bl Arbusto1

				mov x1,270
				mov x2,250
				bl Pino3

				mov x1,230
				mov x2,260
				bl Pino3

				mov x1,105
				mov x2,265
				bl Pino2

				mov x1,120
				mov x2,261
				mov x3,138
				mov x4,270
				bl Arbusto1

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

				mov x1,80
				mov x2,265
				bl Pino3

				mov x1,90
				mov x2,285
				bl Pino2

				mov x1,40
				mov x2,243
				bl Pino3

				mov x1,55
				mov x2,241
				mov x3,73
				mov x4,250
				bl Arbusto1

				mov x1,0
				mov x2,255
				bl Pino2

				// derecha
				mov x1,380
				mov x2,240
				bl Pino3

				mov x1,400
				mov x2,250
				bl Pino3

				mov x1,423
				mov x2,240
				mov x3,437
				mov x4,248
				bl Arbusto1

				mov x1,500
				mov x2,265
				bl Pino3

				mov x1,460
				mov x2,280
				bl Pino2

				mov x1,555
				mov x2,240
				mov x3,570
				mov x4,248
				bl Arbusto1

				mov x1,540
				mov x2,250
				bl Pino3

				mov x1,565
				mov x2,246
				mov x3,580
				mov x4,254
				bl Arbusto1

				mov x1,527
				mov x2,248
				mov x3,545
				mov x4,257
				bl Arbusto1

				mov x1,610
				mov x2,235
				mov x3,628
				mov x4,244
				bl Arbusto1

				mov x1,600
				mov x2,240
				mov x3,618
				mov x4,249
				bl Arbusto1

				mov x1,632
				mov x2,250
				bl Pino3

			// Medianos del medio

				mov x1,600
				mov x2,298
				bl Pino2

				mov x1,565
				mov x2,305
				bl Pino2

				mov x1,590
				mov x2,330
				bl Pino2

				mov x1,505
				mov x2,260
				mov x3,523
				mov x4,269
				bl Arbusto1

				mov x1,520
				mov x2,320
				bl Pino2

				mov x1,540
				mov x2,300
				mov x3,558
				mov x4,309
				bl Arbusto1

				mov x1,620
				mov x2,300
				mov x3,638
				mov x4,309
				bl Arbusto1

				mov x1,630
				mov x2,310
				mov x3,648
				mov x4,319
				bl Arbusto1

			// Grandes del frente

				// detras de la casa
				mov x1,480
				mov x2,305
				bl Pino3

				mov x1,430
				mov x2,305
				bl Pino2

				mov x1,447
				mov x2,320
				bl Pino2

				mov x1,550
				mov x2,370
				bl Pino1

				mov x1,380
				mov x2,400
				bl Pino1
				
				mov x1,500
				mov x2,380
				bl Pino1

				mov x1,530
				mov x2,380
				bl Pino1

				mov x1,615
				mov x2,415
				bl Pino2

				mov x1,592
				mov x2,420
				bl Pino2

			// Espacio vacio

				mov x1,20
				mov x2,280
				bl Pino3

				mov x1,50
				mov x2,290
				bl Pino3

				mov x1,120
				mov x2,300
				bl Pino3

				mov x1,185
				mov x2,310
				bl Pino2

				mov x1,245
				mov x2,290
				bl Pino2

				mov x1,280
				mov x2,310
				bl Pino2

				mov x1,300
				mov x2,260
				bl Pino3

				mov x1,350
				mov x2,250
				bl Pino3

				mov x1,290
				mov x2,218
				mov x3,308
				mov x4,226
				bl Arbusto1

				mov x1,380
				mov x2,280
				bl Pino2

		// Fin vegetacion

		// Casa

		mov x1,346
		mov x2,430
		bl Tronco1

		mov x1,354
		mov x2,420
		bl Tronco1

		mov x1,361
		mov x2,430
		bl Tronco1

		mov x1,362
		mov x2,410
		bl Tronco1

		mov x1,369
		mov x2,420
		bl Tronco1

		mov x5,50	// Para decidir a qué altura poner la casa
		mov x6,-50	// Para decidir a qué ancho poner la casa

		mov x1,496
		mov x2,385
		add x1,x1,x6
		add x2,x2,x5
		bl Edificio1

		mov x1,460
		mov x2,310
		add x1,x1,x6
		add x2,x2,x5
		bl Ventanas

		mov x1,473
		mov x2,352
		add x1,x1,x6
		add x2,x2,x5
		bl Ventanas

		mov x1,421
		mov x2,391
		add x1,x1,x6
		add x2,x2,x5
		bl Macetas

		mov x1,411
		mov x2,372
		add x1,x1,x6
		add x2,x2,x5
		mov x3,429
		mov x4,381
		add x3,x3,x6
		add x4,x4,x5
		bl Arbusto1

		mov x1,500
		mov x2,391
		add x1,x1,x6
		add x2,x2,x5
		bl Macetas

		mov x1,490
		mov x2,372
		add x1,x1,x6
		add x2,x2,x5
		mov x3,508
		mov x4,381
		add x3,x3,x6
		add x4,x4,x5
		bl Arbusto1

		// Fin casa

		// Continua vegetacion

			// delante de la casa
				mov x1,543
				mov x2,450
				bl Pino1

				mov x1,630
				mov x2,480
				bl Pino1

				mov x1,506
				mov x2,440
				mov x3,529
				mov x4,458
				bl Arbusto1

				mov x1,495
				mov x2,446
				mov x3,510
				mov x4,457
				bl Arbusto1

				mov x1,525
				mov x2,450
				mov x3,540
				mov x4,461
				bl Arbusto1

		// Fin de vegetacion

		cbz x7,Paisaje_capa_delante_dia
			mov x1,0
			mov x2,0
			mov x3,x19
			mov x4,x20
			bl Oscurecer
			bl Oscurecer
		Paisaje_capa_delante_dia:

	ldr x7,[sp],8
	ldr x8,[sp],8
	ldr x29,[sp],8
	ldr x30,[sp],8
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
	str x5,[sp,-8]!
	str x11,[sp,-8]!

	mov x11,x7
	mov x7,x2

	cbnz x8,Paisaje_completo_noche_satelite
		bl Dibuja_fondo_amanecer1
		bl Dibuja_sol_amanecer
		b Paisaje_completo_noche_satelite_end
	Paisaje_completo_noche_satelite:
		bl Dibuja_fondo_noche
		bl Dibuja_luna
	Paisaje_completo_noche_satelite_end:
	
	// copio el prebuffer
	cbz x5, Paisaje_completo_copia_prebuffer
		bl Paisaje_capa_delante
	Paisaje_completo_copia_prebuffer:

	cmp x11,3	// MOV SOL - 1
	b.ne Paisaje_completo_no_cambiar_tono
		bl Oscuridad_o_claridad_prebuffer
	Paisaje_completo_no_cambiar_tono:

	bl Pasar_al_buffer_el_paisaje_delante

	// Seccion fogata

		mov x1,55
		mov x2,455
		bl Pasto_grupal_izq

		mov x1,70
		mov x2,450
		bl Tronco1

		mov x1,127
		mov x2,457
		bl Pasto_grupal_der
		bl Pasto_grupal_izq

		mov x1,150
		mov x2,420
		bl Tronco2

		mov x1,150
		mov x2,445
		bl Tronco2

		mov x1,160
		mov x2,427
		bl Tronco2

		mov x1,85
		mov x2,420
		bl Tronco2

		mov x1,70
		mov x2,430
		bl Tronco2

		mov x1,110
		mov x2,420
		mov x3,135
		mov x4,420
		bl Fogata

	ldr x5,=0xF5F5F3
	cbz x8,Paisaje_completo_dia_color_nube
		// color de nube
		ldr x5,=0x808080

		// ILUMINACIÓN DE VENTANAS DE NOCHE

			// GRANDES
			ldr x0,=0xA0A13A
			mov x1,407
			mov x2,360
			mov x3,418
			mov x4,352
			bl Pinta_rectangulo

			ldr x0,=0xA0A13A
			mov x1,420
			mov x2,402
			mov x3,431
			mov x4,394
			bl Pinta_rectangulo

			// PEQUEÑAS

			// Las de la ventana de abajo
			ldr x0,=0xA0A13A
			mov x1,428
			mov x2,410
			mov x3,431
			mov x4,405
			bl Pinta_rectangulo

			ldr x0,=0xA0A13A
			mov x1,421
			mov x2,410
			mov x3,425
			mov x4,405
			bl Pinta_rectangulo

			// Las de la ventana de arriba
			ldr x0,=0xA0A13A
			mov x1,415
			mov x2,368
			mov x3,418
			mov x4,363
			bl Pinta_rectangulo

			ldr x0,=0xA0A13A
			mov x1,408
			mov x2,368
			mov x3,412
			mov x4,363
			bl Pinta_rectangulo
		
		bl Humo_chimenea_noche
		b Paisaje_completo_seguir
	Paisaje_completo_dia_color_nube:
		bl Humo_chimenea_dia
	Paisaje_completo_seguir:
	mov x1,x6
	mov x2,50
	bl ConjuntoNubes

	add x1,x1,300
	mov x2,100
	bl ConjuntoNubes

	Paisaje_completo_end:	
		ldr x11,[sp],8
		ldr x5,[sp],8
		ldr x1,[sp],8
		ldr x2,[sp],8
		ldr x7,[sp],8
		ldr x6,[sp],8
		ldr x30,[sp],8
		ret

