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
	.equ NUBE_BLANCO, 0xF5F5F3
	.equ NUBE_GRIS, 0xB9D9E8


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

	bl Dibuja_fondo_amanecer1
	bl Dibuja_sol_amanecer
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

		mov x1,120
		mov x2,50
		bl ConjuntoNubes

		mov x1,420
		mov x2,50
		bl ConjuntoNubes

		mov x1,420
		mov x2,410
		mov x3,494
		mov x4,410
		mov x5,458
		mov x6,334
		bl Carpa
	

	b InfLoop

