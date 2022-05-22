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
		ret

	// Pinta fondo --> Toma x10 como parametro para el color
	PintaFondo:
		sub sp,sp,16
		str x30,[sp]					   // Guardo x30

		mov x0,x20						   // Seteo en X0 la direccion base del framebuffer
		mov x1,SCREEN_WIDTH			   	   // Ancho
		mov x2,SCREEN_HEIGHT		  	   // Altura
		bl PintaRectangulo

		ldr x30,[sp]					   // Restauro x30
		add sp,sp,16
		ret

	// Pinta rectangulo --> Argumentos
							// x0 --> Posición arriba a la izquierda
							// x1 --> Ancho
							// x2 --> Alto
							// x10 --> Color
	PintaRectangulo:
		PintaRectangulo_filas:
			mov x3,x1
		PintaRectangulo_columnas:
			stur w10,[x0]						// Coloreo el pixel
			add x0,x0,4	   				  	    // Me voy al siguiente pixel
			sub x3,x3,1  				    	// Completé la columna de esta fila
			cbnz x3,PintaRectangulo_columnas    // Si no es la última columna, paso a la siguiente
			sub x2,x2,1    					    // Completé la fila
			cbnz x2,PintaRectangulo_filas
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

	// Rectángulo rojo de coords (0,0) , (300,400)
	ldr x10,=ROJO
	mov x0,x20
	mov x1,300
	mov x2,400
	bl PintaRectangulo

	b InfLoop
