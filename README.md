# Explicación detallada del código realizado

## Defines o *variables globales*

### Tamaño del FrameBuffer
```
LARGO_FRAMEBUFFER = 480
ANCHO_FRAMEBUFFER = 640
BITS_PER_PIXEL = 32
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
* `x28` -> **SP -> Stack Pointer**
* `x29` -> **FP -> Frame Pointer. Se pone la dirección base del framebuffer**
* `x30` -> **Direcciones para los return de las funciones**


## Datos piolas a tener en cuenta

### **- ¿Cómo guardo las variables si no quiero perder el valor pero debo modificarlas en la función?**

Sencillo, usando el stack. Para ello, sean x1,x2,x3 los registros que queremos guardar, debemos poner
```
// Para guardar los valores
str x1,[sp,-8]!
str x2,[sp,-8]!
str x3,[sp,-8]!

    //
    // Resto del código ...
    //

// Para recuperar los valores
ldr x3,[sp],8
ldr x2,[sp],8
ldr x1,[sp],8
```

Igual, puede hacerse pesado tener que poner todo esto si son muchos los registros a guardar. Para ello está el ejecutable `fast` (un .cpp compilado). Si le pasamos los nros de los registros que queremos guardar separados por un espacio y al final la palabra *fin*, devuelve todas las instrucciones en el orden correcto que se deben colocar. Solo recordar que str va al principio del código mientras que los ldr al último para recuperar los valores.

### **- Me da vagancia y me pierdo escribiendo los nombres de los registros, ¿no se pueden crear variables?**

No, no se pueden crear variables pero si se pueden usar *apodos* para los registros. Para ello, se debe tener en cuenta que para "habilitar" un apodo dentro de una función, debe utilizarse la siguiente instrucción:
```
Estructura ->
    apodo   .req    registro

Ejemplo ->
    color .req w10
    xpixel .req x9
    ypixel .req
```
Luego, recordar de "deshabilitar" estos apodos antes de terminar la función. Para ello, se hace lo siguiente:
```
Estructura ->
    .unreq  apodo

Ejemplo ->
    .unreq color
    .unreq xpixel
    .unreq ypixel
```


## Funciones para creación de figuras

Estas funciones están implementadas en **`formas_geometricas.s`**

### **- Dibujar pixel**

#### Argumentos

* `x0` -> color
* `(x9,x10)` -> punto en el plano cartesiano

#### Funcionamiento

Si el punto pertenece al Frame Buffer, se pinta el pixel correspondiente a la dirección de memoria
```
x12 = x29 + 4 * ((LARGO_FRAMEBUFFER - x10) * ANCHO_FRAMBUFFER + x9)
```
Puede resultar diferente a la dada por los profesores, pero esto se debe a una cuestión de comodidad ya que se prefiere trabajar con el eje de coordenadas cartesianas al que estamos acostumbrados.

#### Llamada

Se llama simplemente escribiendo
```
bl Pinta_punto
```
**Notar que es una función nativa.**



### **- Dibujar una línea**

#### Argumentos

* `x0` -> color
* `(x1,x2)` y `(x3,x4)` -> extremos de la línea

#### Funcionamiento

Pinta la línea de extremos (x1,x2) y (x3,x4) del color x0. Se realiza utilizando el [**Algoritmo de Bresenham para líneas**](https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm).

#### Llamada

Se llama simplemente escribiendo
```
bl Pinta_linea
```

**Notar que es una función global.**