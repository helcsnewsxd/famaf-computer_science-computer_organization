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

		ldr x0,=CELESTE
		mov x1,0
		mov x2,0
		mov x3,SCREEN_WIDTH
		mov x4,0
		mov x5,0
		mov x6,SCREEN_HEIGHT
		mov x7,SCREEN_WIDTH
		mov x8,SCREEN_HEIGHT
		bl Pinta_cuadrilatero
		
		ldr x0,=AMARILLO
		mov x1,400
		mov x2,400
		mov x3,50
		bl Pinta_circulo

		ldr x0,=BLANCO
		mov x1,350
		mov x2,350
		mov x3,20
		bl Pinta_circulo
		mov x1,370
		bl Pinta_circulo
		mov x1,360
		mov x2,370
		mov x3,15
		bl Pinta_circulo
		mov x2,340
		bl Pinta_circulo
		
		ldr x0,=MARRON
		mov x1,180
		mov x2,0
		mov x3,180
		mov x4,200
		mov x5,120
		mov x6,0
		mov x7,120
		mov x8,200
		bl Pinta_cuadrilatero
		ldr x0,=VERDE_OSCURO
		mov x1,80
		mov x2,100
		mov x3,220
		mov x4,100
		mov x5,150
		mov x6,300
		bl Pinta_triangulo
		mov x1,100
		mov x2,200
		mov x3,200
		mov x4,200
		mov x5,150
		mov x6,400
		bl Pinta_triangulo

	b InfLoop
