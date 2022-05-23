# Ideas a plantear para mejorar el código

## Defines o *variables globales*

### Tamaño del FrameBuffer

* `LARGO_FRAMEBUFFER = 480`
* `ANCHO_FRAMEBUFFER = 640`

### Colores

* `AMARILLO = 0xFFF000`
* `AZUL = 0xFF`
* `AZUL_CLARO = 0x3333FF`
* `AZUL_OSCURO = 0x000066`
* `BLANCO = 0xFFFFFF`
* `CELESTE = 0x00FFEF`
* `GRIS = 0x808080`
* `MARRON = 0x663300`
* `NARANJA = 0xFF8000`
* `NEGRO = 0x0`
* `ROJO = 0xFF0000`
* `ROJO_CLARO = 0xFF3333`
* `ROJO_OSCURO = 0xCC0000`
* `ROSA = 0xFF66FF`
* `TURQUESA = 0x33FF99`
* `VERDE = 0xFF00`
* `VERDE_CLARO = 0x66FF66`
* `VERDE_OSCURO = 0x006600`
* `VIOLETA = 0xB300C0`

## Uso de los Registros

* `x0` -> **Color**
* `(x1,x2) , (x3,x4)` -> **Van a marcar pares de puntos en vista del framebuffer como una grilla**
* `x28` -> **SP -> Stack Pointer**
* `x29` -> **FP -> Frame Pointer. Se pone la dirección base del framebuffer**
* `x30` -> **Direcciones para los return de las funciones**

## Funciones para creación de figuras

La idea sería que estas estén todas juntas en un **archivo aparte**, como por ejemplo **`formas_geometricas.s`**

### Dibujar pixel

Dándole `xo` y `(x9,x10)` como argumentos, pinta el pixel correspondiente a
```
x12 = x29 + 4 * (x10 * LARGO_PANTALLA + x9)
```
del color dado por `x9`