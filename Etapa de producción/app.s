// Defines
	.equ SCREEN_WIDTH, 640
	.equ SCREEN_HEIGHT, 480
	.equ BITS_PER_PIXEL, 32

// Colores piolas

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


// Inicializo los registros

	IniRegistros:
		mov x29,x0
		mov x19,SCREEN_WIDTH
		mov x20,SCREEN_HEIGHT
		ret

// Loop infinito para poder ver el trabajo

	InfLoop:
		b InfLoop


.globl main
main:
	bl IniRegistros

		/**
			mov x1,40
			mov x2,232
			mov x3,85
			mov x4,325
		bl Crea_edificio

			mov x1,106
			mov x2,144
			mov x3,130
			mov x4,325
		bl Crea_edificio

			mov x1,160
			mov x2,190
			mov x3,245
			mov x4,325
		bl Crea_edificio

			mov x1,302
			mov x2,100
			mov x3,345
			mov x4,325
		bl Crea_edificio

			mov x1,375
			mov x2,230
			mov x3,460
			mov x4,325
		bl Crea_edificio

			mov x1,509
			mov x2,250
			mov x3,530
			mov x4,325
		bl Crea_edificio

			mov x1,561
			mov x2,74
			mov x3,600
			mov x4,325
		bl Crea_edificio
		**/

		// AMANECER
		//bl Dibuja_fondo_noche
		//bl Dibuja_luna
		bl Dibuja_fondo_amanecer1
		bl Dibuja_sol_amanecer
		bl Dibuja_pasto

		// ARBOL
		mov x1,200
		mov x2,300
		bl Pino1

		mov x1,300
		mov x2,300
		bl Pino2

		mov x1,159
		mov x2,289
		mov x3,175
		mov x4,300
		bl Arbusto1

		mov x1,239
		mov x2,282
		mov x3,262
		mov x4,300
		bl Arbusto1
	
		mov x1,254
		mov x2,289
		mov x3,269
		mov x4,300
		bl Arbusto1
		
		bl Dibuja_fondo_noche
		bl Dibuja_luna

		mov x1,0
		mov x2,0
		mov x3,SCREEN_WIDTH
		mov x4,SCREEN_WIDTH
		//bl Oscurecer // -> SE BUGUEA CON ESTO

		bl Dibuja_fondo_amanecer2

	b InfLoop

