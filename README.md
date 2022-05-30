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

* `x0` → **Color**
* `x19` → **ANCHO_FRAMEBUFFER**
* `x20` → **LARGO_FRAMEBUFFER**
* `x27` → **Address para return de itera línea**
* `x28` → **SP -> Stack Pointer**
* `x29` → **FP -> Frame Pointer. Se pone la dirección base del framebuffer**
* `x30` → **Direcciones para los return de las funciones**


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

Igual, puede hacerse pesado tener que poner todo esto si son muchos los registros a guardar. Para ello está el ejecutable [**fast**](/Etapa%20de%20producci%C3%B3n/fast) (un .cpp compilado). Si le pasamos los nros de los registros que queremos guardar separados por un espacio y al final la palabra *fin*, devuelve todas las instrucciones en el orden correcto que se deben colocar. Solo recordar que str va al principio del código mientras que los ldr al último para recuperar los valores.
Un ejemplo de llamada puede ser:
```
┌──(helcsnewsxd㉿helcsnewsxd)-[~/Documentos/FaMAF/Segundo/Primer cuatri/ODC/lab/ODC-2022-LAB/Pruebas]
└─$ ./fast          // Ejecutamos fast
1 2 3 4 5 fin       // Esto sería lo que se pondría como input, el resto nos lo da el ejecutable
str x1,[sp,-8]!
str x2,[sp,-8]!
str x3,[sp,-8]!
str x4,[sp,-8]!
str x5,[sp,-8]!

ldr x5,[sp],8
ldr x4,[sp],8
ldr x3,[sp],8
ldr x2,[sp],8
ldr x1,[sp],8
```

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

#### *Argumentos*

* `x0` → color
* `(x9,x10)` → punto en el plano cartesiano con (0,0) arriba a la izquierda (nos queda mejor para el PixelArt)

#### *Funcionamiento*

Si el punto pertenece al Frame Buffer, se pinta el pixel correspondiente a la dirección de memoria
```
x12 = x29 + 4 * (x10 * ANCHO_FRAMBUFFER + x9)
```

#### *Llamada*

Se llama simplemente escribiendo
```
bl Pinta_punto
```
**Notar que es una función nativa.**


### **- Itera línea**

#### *Argumentos*

* `(x1,x2) y (x3,x4)` extremos de la línea

#### *Funcionamiento*

Usando el **algoritmo de bresenham**, esta función devuelve todos los puntos que cumplen pertenecer a este segmento.

#### *Llamada*

Es un poco más rara la llamada debido a que se corta la función a mitad del proceso y luego se retoma. Hay que tener mucho cuidado con el guardado de los registros para no modificar algo que no queremos.

Un ejemplo de llamada es:

```
// (x1,x2) y (x3,x4) extremos
    str x26,[sp,-8]!
    str x30,[sp,-8]!
    
    bl Itera_linea

    // if x26 == FIN_ITERACION
    cmp x26,FIN_ITERACION
    b.eq Pinta_linea_fin_iteracion
        // else
        str x30,[sp,-8]!
        
        // Acá va lo que se hace con el punto que pertenece a esa recta.
        // Tener en cuenta que si se modifican registros, hay que guardalos en el stack

        ldr x30,[sp],8

        ret     // para que me itere al siguiente punto

    Pinta_linea_fin_iteracion:

    ldr x30,[sp],8
    ldr x26,[sp],8

    ret
```

**Notar que es una función global.**


### **- Dibujar una línea**

#### *Argumentos*

* `x0` → color
* `(x1,x2)` y `(x3,x4)` → extremos de la línea

#### *Funcionamiento*

Pinta la línea de extremos (x1,x2) y (x3,x4) del color x0. Se realiza utilizando el **Algoritmo de Bresenham para líneas**. Para ello, se llama directamente a la función de itera línea.

#### *Llamada*

Se llama simplemente escribiendo
```
bl Pinta_linea
```

**Notar que es una función global.**


### **- Pinta triángulo**

#### *Argumentos*

* `x0` → color
* `(x1,x2)`, `(x3,x4)` y `(x5,x6)` → extremos
* `x26` → lo que se le va sumando al color

#### *Funcionamiento*

Utilizando la función de itera línea, la idea es iterar por todos los puntos del segmento de extremos (x1,x2) y (x3,x4), y dado (x,y) perteneciente a este, se pinta la línea de extremos (x,y) y (x5,x6). Se va sumando x26 en cada pinta_linea al color.

#### *Llamada*

Se llama simplemente poniendo
```
bl Pinta_triangulo
```

**Notar que es una función global.**


### **- Pinta rectángulo básico**

#### *Argumentos*

* `x0` → color
* `(x1,x2) y (x3,x4)` → extremos opuestos
* `x26` → lo que se le suma al color

#### *Funcionamiento*

Se itera por todos los puntos del rectángulo y se los pinta. La idea es usar fuertemente que los puntos que se dan son extremos opuestos y que el rectángulo es de lados *paralelos a los bordes*. Se le va sumando x26 al color en cada iteración del eje y.

#### *Llamada*

Se llama simplemente poniendo
```
bl Pinta_rectangulo
```

**Notar que es una función global.**


### **- Pinta cuadrilátero**

#### *Argumentos*

* `x0` → color
* `(x1,x2)`, `(x3,x4)`, `(x5,x6)` y `(x7,x8)` → extremos del cuadrilátero
* `x26` → lo que se le suma al color

#### *Funcionamiento*

Pinta el cuadrilátero formado por esos cuatro puntos distintos. Se utiliza la función de Pinta triángulo teniendo en cuenta que hay que pintar tres para asegurarnos cubrir toda la zona. Por ende, también afecta x26 al color.

#### *Llamada*

Se llama simplemente escribiendo:
```
bl Pinta_cuadrilatero
```

**Notar que es una función global.**


### **- Dibuja círculo **

#### *Argumentos*

* `x0` → color
* `(x1,x2)` → centro
* `x3` → radio

#### *Funcionamiento*

Utilizando el algoritmo de bresenham para circunferencias, esta función dibuja la circunferencia (sin relleno) de centro (x1,x2) y radio x3.

#### *Llamada*

```
bl Dibuja_circulo
```

**Es una función global.**


### **- Pinta círculo texturado**

#### *Argumentos*

* `x0` → color
* `(x1,x2)` → centro
* `x3` → radio
* `x26` → lo que se le va sumando al color

#### *Funcionamiento*

La idea es que quede un círculo con "textura" al que le falten algunos píxeles. Para ello, se usa la función Dibuja círculo (que usa bresenham) para hacer todos los círculos de radio entero menor o igual a `x3`. Entre el dibujo de cada circunferencia, se suma x26 al color.

#### *Llamada*

```
bl Pinta_circulo_texturado
```

**Notar que es una función global.**


### **- Pinta circulo**

#### *Argumentos*

* `x0` → color
* `(x1,x2)` → centro
* `x3` → radio
* `x26` → lo que se le va sumando al color

#### *Funcionamiento*

La idea es tener un círculo de color sólido sin "texturas". Es decir que todos los píxeles estén pintados. Para ello, se itera por todos los puntos pertenecientes al cuadrado que tiene el círculo inscripto a él y a los que cumplan que ``r^2 >= x^2 + y^2`` se los pinta. Por cada punto pintado se suma x26 al color.

#### *Llamada*

```
bl Pinta_circulo
```

**Notar que es una función global.**


## **Dibujos**

### **- Fondo de amanecer** 🌅 

#### *Funcionamiento*
Coloca en la mitad superior del framebuffer un fondo de amanecer copado.

#### *Llamada*
```
bl Dibuja_fondo_amanecer
```

**Notar que es una función global.**


### **- Sol de amanecer** ☀️ 

#### *Funcionamiento*
Coloca en la mitad superior derecha del framebuffer un sol de amanecer copado.

#### *Llamada*
```
bl Dibuja_sol_amanecer
```

**Notar que es una función global.**


### **- Crea Edificios** 🏢 

#### *Argumentos*
* `(x1,x2)` → Extremo superior izquierdo
* `(x3,x4)` → Extremo inferior derecho

#### *Funcionamiento*

A partir de dos puntos extremos, la función genera un edificio de tamaño variable constituído por un rectángulo frontal y dos paralelogramos adyacentes, uno en la parte superior y otro en el lateral derecho. Además de generar los respectivos cuadriláteros, también genera un conjunto de ventanas de tamaño fijo que se distribuyen a lo largo del rectángulo frontal siempre y cuando haya espacio necesario para una nueva columna y/o fila de ventanas. Por último, genera una puerta en el medio del edificio para darle más detalle. La generación de los paralelogramos y ventanas se hace partiendo de los dos puntos recibidos como argumentos, modificándolos a través de operaciones aritméticas siempre relativas a los límites del rectángulo frontal.

#### *Llamada*

```
bl Crea_edificio
```

**Notar que es una función global.**

### **- Pino** 🌲 

#### *Argumentos*
* `(x1,x2)` → Origen del tronco. El pino se genera desde este punto hacia arriba.

#### *Funcionamiento*

A partir de un punto, se genera un pino de tamaño fijo con dos posibles variaciones (grande y mediano).

#### *Llamada*

Pino grande ↓
```
bl Pino1
```
Pino mediano ↓
```
bl Pino2
```
**Notar que es una función global.**

### **- Arbusto** 🥬 

#### *Argumentos*
* `(x1,x2)` → Extremo superior izquierdo
* `(x3,x4)` → Extremo inferior derecho

#### *Funcionamiento*

A partir de dos puntos extremos, se genera un arbusto de tamaño variable. Es importante que se respete que (x1,x2) es el extremo superior izquierdo y (x3,x4) el extremo inferior derecho.

#### *Llamada*
```
bl Arbusto1
```

**Notar que es una función global.**



