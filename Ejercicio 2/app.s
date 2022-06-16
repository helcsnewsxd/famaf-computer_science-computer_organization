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

.equ MOV_SOL, 4
.equ MOV_NUBE, 4

	InfLoop:
		cmp x2,-70
		b.ge InfLoop_mismo_tiempo
			mov x1,550
			mov x2,150
			eor x8,x8,1

			mov x5,1
		InfLoop_mismo_tiempo:

		sub x7,x7,1
		bl Paisaje_completo
		bl Pasar_al_buffer
		add x6,x6,MOV_NUBE
		cbnz x7, InfLoop
		sub x1,x1,1
		sub x2,x2,1
		ldr x7,=MOV_SOL

		mov x5,0

		mov x0,0xfffff
		loop:
			sub x0,x0,1
			cbnz x0,loop
		b InfLoop


.globl main
main:
	bl IniRegistros

	ldr x7,=MOV_SOL
	mov x6,0
	mov x1,500
	mov x2,100
	mov x8,0
	mov x5,1

	b InfLoop
