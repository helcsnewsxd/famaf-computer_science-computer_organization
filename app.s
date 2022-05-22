//-------------------------------- DEFINES ---------------------------
//------------ BASICOS ----------------
.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGHT, 480
.equ BITS_PER_PIXEL, 32

//------------ COLORES ----------------
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

//Los colores se cargan en un registro (ej x10) haciendo ldur x10,=LABEL
//--------------------------------------------------------------------


//---------------------------- CÓDIGO -------------------------------
//---------- USO DE REGISTROS -----------
	// Arguments - Results
		// X0 al X7 --> Iterador o argumentos para las funciones ==> Algunos marcan posiciones en el framebuffer

	// Saved
		// X20 --> Dirección base del framebuffer
		// X21 --> SCREEN_WIDTH
		// X22 --> SCREEN_HEIGHT

	// Return Adress
		// X30 --> Marca la instrucción para volver después de una función
				// Como vamos a llamar funciones dentro de otras funciones, es necesario el uso del stack
				// por lo que vamos a hacer manejo del x28 = sp, salvando los x30 de cada función para retornar:
					// Guardar x30 en el stack
						//	sub sp,sp,16
						//	str x30,[sp]

					// Recuperar x30 del stack
						// ldr x30,[sp]
						// add sp,sp,16
				// Pero tener en cuenta que si se pasan argumentos, no hay que restar solo 16, sino
				// que depende de la carntidad de argumentos que tenga
				// Se retorna con ret a la posición marcada por x30

//-----------------------------------------------------------------

//------------------------- FUNCIONES ------------------------------

	// Inicialización de registros
	IniRegistros:
		mov x20,x0
		mov x21,SCREEN_WIDTH
		mov x22,SCREEN_HEIGHT
		ret

	// Pinta fondo --> Toma x10 como parametro para el color
	PintaFondo:
		sub sp,sp,16
		str x30,[sp]					   // Guardo x30

		mov x0,0
		mov x1,0
		mov x2,x21		   	   // Ancho
		mov x3,x22		  	   // Altura
		mov x4,0
		bl PintaParalelogramo

		ldr x30,[sp]					   // Restauro x30
		add sp,sp,16
		ret

	// Pinta paralelogramo --> Argumentos
							// x0 --> Nro de fila inicial
							// x1 --> Nro de columna inicial
							// x2 --> Ancho 
							// x3 --> Largo
							// x4 --> Cambio de inicio de la siguiente columna
							// x10 --> Color
							// Se debe cumplir que 640 * x3 + x2 <= 76800
	PintaParalelogramo:
		// x11 --> Pos inicial de cada fila
		// x12 --> Iterador en cada fila
		// x13 --> Ancho
		// x14 --> Largo
		// x15 --> x3 * (x4 * 640) + x2 <= 76800 --> Cambio de x11 para pasar a la siguiente fila
		mov x16,1
		madd x15,x16,x21,x4
		lsl x15,x15,2

		// x11 = x20 + 4 * (x0 * SCREEN_WIDTH + x1)
		madd x11,x0,x21,x1
		lsl x11,x11,2
		add x11,x11,x20

		mov x14,x3

		PintaParalelogramo_fila:
			mov x12,x11
			mov x13,x2
		PintaParalelogramo_columna:
			stur w10,[x12]
			add x12,x12,4
			sub x13,x13,1
			cbnz x13,PintaParalelogramo_columna 	// Termino la fila actual
			sub x14,x14,1
			
			// x11 = x20 + 4 [ (x0+1)*SCR + (x1+x4) ]
			add x11,x11,x15
			cbnz x14,PintaParalelogramo_fila		// Termino todas las filas
		ret

	// Pinta circulo --> Argumentos
							// x0 --> Nro de fila del centro
							// x1 --> Nro de columna del centro
							// x2 --> Radio
							// x10 --> Color
							// Se pintan las posiciones (x,y) tales que
										// (x-x1)^2 + (y-x0)^2 =r^2
							// Se debe cumplir que (x1,x0) esté a distancia al menos r de los bordes
	PintaCirculo:
		// x9 --> Itero por los x
		// x18 --> Itero por los y
		// x11 --> Radio cuadrado
		// x12 --> Nodo a pintar
		mul x11,x2,x2	// r^2
		mov x9,-1		// Cant de filas vistas
		PintaCirculo_x:
			add x9,x9,1		// Termine de ver la fila
			mov x18,0		// Reset al iterador de los y
			cmp x9,x22
			b.eq end		// Si ya termine de ver todos los casos
		PintaCirculo_y:
			// x15 = (x-x1)^2 + (y-x0)^2
			sub x16,x9,x1
			mul x16,x16,x16
			sub x17,x18,x0
			mul x17,x17,x17
			add x15,x16,x17

			cmp x11,x15
			b.lt siguiente_par			// No me cumple la ecuacion?
			// x12 = x20 + 4 * (x18 * SCREEN_WIDTH + x9)
			madd x12,x18,x21,x9
			lsl x12,x12,2
			add x12,x12,x20
			stur w10,[x12]
			
			siguiente_par:
				cmp x18,x21
				b.eq PintaCirculo_x		// Termine la fila actual
				add x18,x18,1
				b PintaCirculo_y		// Me voy a la siguiente columna
		end:
	ret

	// Loop Infinito
	InfLoop:
		b InfLoop

//--------------------------------------

.globl main
main:
	bl IniRegistros

	// Fondo en blanco
	ldr x10,=BLANCO
	bl PintaFondo

	b InfLoop
