# Explicación detallada del código realizado

## Defines o *variables globales*

### Tamaño del FrameBuffer
```
LARGO_FRAMEBUFFER = 480
ANCHO_FRAMEBUFFER = 640
```
### Colores
```
AMARILLO = 0xFFF000
AZUL = 0xFF
AZUL_CLARO = 0x3333FF
AZUL_OSCURO = 0x000066
BLANCO = 0xFFFFFF
CELESTE = 0x00FFEF
GRIS = 0x808080
MARRON = 0x663300
NARANJA = 0xFF8000
NEGRO = 0x0
ROJO = 0xFF0000
ROJO_CLARO = 0xFF3333
ROJO_OSCURO = 0xCC0000
ROSA = 0xFF66FF
TURQUESA = 0x33FF99
VERDE = 0xFF00
VERDE_CLARO = 0x66FF66
VERDE_OSCURO = 0x006600
VIOLETA = 0xB300C0
```
## Uso de los Registros

* `x0` -> **Color**
* `x19` -> **ANCHO_FRAMEBUFFER**
* `x20` -> **LARGO_FRAMEBUFFER**
* `x27` -> **Adress para saltos de branch -> Tener cuidado con su uso**
* `x28` -> **SP -> Stack Pointer**
* `x29` -> **FP -> Frame Pointer. Se pone la dirección base del framebuffer**
* `x30` -> **Direcciones para los return de las funciones**

## Funciones para creación de figuras

La idea sería que estas estén todas juntas en un **archivo aparte**, como por ejemplo **`formas_geometricas.s`**

### Dibujar pixel

#### Argumentos

* `x0` -> color
* `(x9,x10)` -> punto en el plano cartesiano

#### Funcionamiento

Si el punto pertenece al Frame Buffer, se pinta el pixel correspondiente a la dirección de memoria
```
x12 = x29 + 4 * (x10 * ANCHO_FRAMBUFFER + x9)
```

Notar que es una función nativa de [formas_geometricas.s](formas_geometricas.s)

### Dibujar una línea

Dándole `x0` y `(x1,x2)`, `(x3,x4)`, pinta la línea con extremos `(x1,x2)` y `(x3,x4)` del color `x0`.
La idea es plantear que si `x1 = x3` entonces tiene que ser una vertical (trivial). Caso contrario, sigue la fórmula:
```
f(x) = a * x + b
```
donde
```
a = (x4-x2)/(x3-x1)
b = x2 - a * x1 = x2 - (x4-x2)/(x3-x1) * x1
```
de modo que se pinta `(x,y)` si y solo si `|f(x) - y| < 1`. Sin embargo, resulta trabajoso y tedioso meternos con float numbers. Por ello mismo, notemos que si planteamos `g(x) = f(x)(x3-x1)`, nos queda:
```
g(x) = (x4-x2)(x-x1) + x2(x3-x1)
```
Y se debe cumplir que:
```
|g(x) - y(x3-x1)| < |x3-x1|
```
Lo cual es más lindo de ver ya que son todos enteros.

### Dibujar un paralelogramo

Dados `x0` y los tres puntos `(x1,x2)`, `(x3,x4)`, `(x5,x6)` se pinta el paralelogramo formado por estos del color `x0`. Para ello se va a usar la función *linea*, de modo que vaya iterando por todas las
líneas paralelas al segmento `(x3,x4) - (x5,x6)` por sus extremos en `(x1,x2) - (x3,x4)`

### Dibujar un cuadrado

Dados `x0` color y `(x1,x2)` , `(x3,x4)` extremos, se plantea su versión como paralelogramo y se usa la función *paralelogramo*. Por ello, se tiene en cuenta que el tercer punto es:
```
(x,y) = (x3,x2)
```

### Dibujar un triángulo

Dados `x0` color y `(x1,x2)`, `(x3,x4)`, `(x5,x6)` extremos, se plantea el pintado de todas las lineas formadas por `(x1,x2)` y `(x,y)` como extremos usando la función *linea*. Para ello, notar que cada `(x,y)` se obtiene de la iteración de los puntos del segmento `(x3,x4) - (x5,x6)`

### Dibujar un círculo

Dados `x0` el color, `(x1,x2)` el centro y `x3` el radio, se plantea el pintado de todos los puntos `(x,y)` que cumplan
```
r^2 >= (x-x1)^2 + (y - x2)^2
```
Se itera por todos los `(x,y)` posibles de la grilla del Frame Buffer
