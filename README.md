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

Estas funciones están implementadas en **`formas_geometricas.s`**

### - Dibujar pixel

#### Argumentos

* `x0` -> color
* `(x9,x10)` -> punto en el plano cartesiano

#### Funcionamiento

Si el punto pertenece al Frame Buffer, se pinta el pixel correspondiente a la dirección de memoria
```
x12 = x29 + 4 * (x10 * ANCHO_FRAMBUFFER + x9)
```

#### Llamada

Se llama simplemente escribiendo
```
bl pinta_punto
```
**Notar que es una función nativa.**


### - Iterar los puntos en un segmento

#### Argumentos

* `(x1,x2)` y `(x3,x4)` -> extremos del segmento

#### Funcionamiento

Esta función devuelve todos los puntos que están lo suficientemente cerca al segmento de extremos (x1,x2) y (x3,x4). La idea es plantear que si `x1 = x3` entonces tiene que ser una vertical (trivial). Caso contrario, sigue la fórmula:
```
f(x) = a * x + b
```
donde
```
a = (x4-x2)/(x3-x1)
b = x2 - a * x1 = x2 - (x4-x2)/(x3-x1) * x1
```
de modo que se devuelve `(x,y)` si y solo si `|f(x) - y| < 1`. Sin embargo, resulta trabajoso y tedioso meternos con float numbers. Por ello mismo, notemos que si planteamos `g(x) = f(x)(x3-x1)`, nos queda:
```
g(x) = (x4-x2)(x-x1) + x2(x3-x1)
```
Y se debe cumplir que:
```
|g(x) - y(x3-x1)| < |x3-x1|
```
Lo cual es más lindo de ver ya que son todos enteros.

#### Llamada

Para poder usar esta función, se debe generar un ciclo ya que queremos que nos devuelva todos los puntos. El ciclo debe ser el siguiente:
```
// (x1,x2) y (x3,x4) extremos
sub sp,sp,8
str x30,[sp]

bl itera_linea // comienza a iterar en el segmento y guardo en x30 la dir de la siguiente linea
sub sp,sp,8
str x30,[sp]

cmp x9,TERMINAR_ITERACION
b.eq ejemplo_iteracion_end

// Acá va lo que queremos hacer con ese punto perteneciente a la recta

ldr x30,[sp]
add sp,sp,8
ret
ejemplo_iteracion_end:
    ldr x30,[sp,8]
    add sp,sp,16
    ret // o bien sigue
```

**Notar que es una función nativa.**


### - Dibujar una línea

#### Argumentos

* `x0` -> color
* `(x1,x2)` y `(x3,x4)` -> extremos de la línea

#### Funcionamiento

Pinta la línea de extremos (x1,x2) y (x3,x4) del color x0. Se realiza usando la función de iteración de la línea.

#### Llamada

Se llama simplemente escribiendo
```
bl pinta_linea
```

**Notar que es una función global**