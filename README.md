# Organización del Computador - Proyecto 2022

## Integrantes

- [Bratti, Juan](https://github.com/juanbratti)
- [Herrador, Emanuel Nicolás](https://github.com/helcsnewsxd)

## ¿De qué se trata?

El proyecto se trata acerca de la realización de una animación en assembler ARMv8 usando el simulador **QEMU** (la idea es que sea "dentro" de una Raspberry Pi). El enunciado del proyecto puede encontrarse [aquí](./enunciado.pdf) y nuestra solución está en este [TAR](./TPQUEMU_Bratti_Herrador.tar.gz).

La animación realizada es un paisaje elaborado por un fondo con montañas y un descampado compuesto por árboles, yuyos, troncos y una casa estilo campestre. Además, se incluyen efectos de día y noche, y un amanecer.

El video terminado se puede encontrar en el siguiente [link](https://www.youtube.com/watch?v=4b9ZXc61V48).

## Documentación a tener en cuenta para el desarrollo (no completa)

### Defines o *variables globales*

#### Tamaño del FrameBuffer
```
LARGO_FRAMEBUFFER = 480
ANCHO_FRAMEBUFFER = 640
BITS_PER_PIXEL = 32
```

#### Algunos colores
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

### Uso de los Registros

* `x0` → **Color**
* `x19` → **ANCHO_FRAMEBUFFER**
* `x20` → **LARGO_FRAMEBUFFER**
* `x21` → **Para que siempre esté dentro del FrameBuffer**
* `x22` → **Sumo al color en x24 en cada iteración**
* `x23` → **Aclarar / Oscurecer**
* `x24` → **Color a cambiar**
* `x25` → **Sumo al color en x0 en cada iteración**
* `x27` → **Address para return de itera línea**
* `x28` → **SP -> Stack Pointer**
* `x29` → **FP -> Frame Pointer. Se pone la dirección base del framebuffer**
* `x30` → **Direcciones para los return de las funciones**

### Datos piolas a tener en cuenta

#### **- ¿Cómo guardo las variables si no quiero perder el valor pero debo modificarlas en la función?**

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

#### **- Me da vagancia y me pierdo escribiendo los nombres de los registros, ¿no se pueden crear variables?**

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

### **Funciones para creación de figuras**

Estas funciones están implementadas en **`formas_geometricas.s`**

Una cosa **importantísima** para destacar en este caso es el uso de algunos registros SAVED. En este caso, vamos a tomar la siguiente convención para todas las funciones de geometría de pintado:

* `x21` → Si x21 es NO nulo, entonces las coordenadas funcionan con  módulo de las longitudes para que siempre se pinte dentro del FrameBuffer. Caso contrario, se pinta normalmente

* `x23` → Si x23 es positivo, se aclara la región. Si x23 es negativo, se oscurece. Caso contrario, si es cero, se pinta normalmente.

* `x24` → x24 es el color a modificar, a cambiar. Si es cero, se cambian todos los colores. Caso contrario, solo los píxeles con color igual a x24.

* `x22` → Lo que se le va sumando al color x24 del mismo modo que se le suma x25 al x0.

* `x25` → Degradado. Es lo que se suma o se resta en las iteraciones para darle un efecto de cambio de color a la figura.

#### **- Dibujar pixel**

##### *Argumentos*

* `x0` → color
* `(x9,x10)` → punto en el plano cartesiano con (0,0) arriba a la izquierda (nos queda mejor para el PixelArt)

##### *Funcionamiento*

Si el punto pertenece al Frame Buffer, se pinta el pixel correspondiente a la dirección de memoria
```
x12 = x29 + 4 * (x10 * ANCHO_FRAMBUFFER + x9)
```

##### *Llamada*

Se llama simplemente escribiendo
```
bl Pinta_punto
```
**Notar que es una función nativa.**


#### **- Itera línea**

##### *Argumentos*

* `(x1,x2) y (x3,x4)` extremos de la línea

##### *Funcionamiento*

Usando el **algoritmo de bresenham**, esta función devuelve todos los puntos que cumplen pertenecer a este segmento.

##### *Llamada*

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


#### **- Dibujar una línea**

##### *Argumentos*

* `x0` → color
* `(x1,x2)` y `(x3,x4)` → extremos de la línea

##### *Funcionamiento*

Pinta la línea de extremos (x1,x2) y (x3,x4) del color x0. Se realiza utilizando el **Algoritmo de Bresenham para líneas**. Para ello, se llama directamente a la función de itera línea.

##### *Llamada*

Se llama simplemente escribiendo
```
bl Pinta_linea
```

**Notar que es una función global.**


#### **- Pinta triángulo**

##### *Argumentos*

* `x0` → color
* `(x1,x2)`, `(x3,x4)` y `(x5,x6)` → extremos
* `x25` → lo que se le va sumando al color

##### *Funcionamiento*

Utilizando la función de itera línea, la idea es iterar por todos los puntos del segmento de extremos (x1,x2) y (x3,x4), y dado (x,y) perteneciente a este, se pinta la línea de extremos (x,y) y (x5,x6). Se va sumando x25 en cada pinta_linea al color.

##### *Llamada*

Se llama simplemente poniendo
```
bl Pinta_triangulo
```

**Notar que es una función global.**


#### **- Pinta rectángulo básico**

##### *Argumentos*

* `x0` → color
* `(x1,x2) y (x3,x4)` → extremos opuestos
* `x25` → lo que se le suma al color

##### *Funcionamiento*

Se itera por todos los puntos del rectángulo y se los pinta. La idea es usar fuertemente que los puntos que se dan son extremos opuestos y que el rectángulo es de lados *paralelos a los bordes*. Se le va sumando x25 al color en cada iteración del eje y.

##### *Llamada*

Se llama simplemente poniendo
```
bl Pinta_rectangulo
```

**Notar que es una función global.**


#### **- Pinta cuadrilátero**

##### *Argumentos*

* `x0` → color
* `(x1,x2)`, `(x3,x4)`, `(x5,x6)` y `(x7,x8)` → extremos del cuadrilátero
* `x25` → lo que se le suma al color

##### *Funcionamiento*

Pinta el cuadrilátero formado por esos cuatro puntos distintos. Se utiliza la función de Pinta triángulo teniendo en cuenta que hay que pintar tres para asegurarnos cubrir toda la zona. Por ende, también afecta x25 al color.

##### *Llamada*

Se llama simplemente escribiendo:
```
bl Pinta_cuadrilatero
```

**Notar que es una función global.**


#### **- Dibuja círculo**

##### *Argumentos*

* `x0` → color
* `(x1,x2)` → centro
* `x3` → radio

##### *Funcionamiento*

Utilizando el algoritmo de bresenham para circunferencias, esta función dibuja la circunferencia (sin relleno) de centro (x1,x2) y radio x3.

##### *Llamada*

```
bl Dibuja_circulo
```

**Es una función global.**


#### **- Pinta círculo texturado**

##### *Argumentos*

* `x0` → color
* `(x1,x2)` → centro
* `x3` → radio
* `x25` → lo que se le va sumando al color

##### *Funcionamiento*

La idea es que quede un círculo con "textura" al que le falten algunos píxeles. Para ello, se usa la función Dibuja círculo (que usa bresenham) para hacer todos los círculos de radio entero menor o igual a `x3`. Entre el dibujo de cada circunferencia, se suma x25 al color.

##### *Llamada*

```
bl Pinta_circulo_texturado
```

**Notar que es una función global.**


#### **- Pinta circulo**

##### *Argumentos*

* `x0` → color
* `(x1,x2)` → centro
* `x3` → radio
* `x25` → lo que se le va sumando al color

##### *Funcionamiento*

La idea es tener un círculo de color sólido sin "texturas". Es decir que todos los píxeles estén pintados. Para ello, se itera por todos los puntos pertenecientes al cuadrado que tiene el círculo inscripto a él y a los que cumplan que ``r^2 >= x^2 + y^2`` se los pinta. Por cada punto pintado se suma x25 al color.

##### *Llamada*

```
bl Pinta_circulo
```

**Notar que es una función global.**


### **Fondos**

Estas funciones están implementadas en **`fondos.s`**

#### **- Nube** ☁️

##### *Funcionamiento*
Genera una nube alrededor de un punto. En el caso de ```ConjuntoNubes```, se generan desde el punto que se da para la derecha →.

##### *Llamada*
Nube grande ↓
``` 
bl Nube1
```
Nube pequeña ↓
``` 
bl Nube2
```
Conjunto de nubes ↓
``` 
bl ConjuntoNubes
```

**Notar que es una función global.**

#### **- Fondo de montañas** ⛰️

##### *Funcionamiento*
Coloca al medio del framebuffer montañas.


##### *Llamada*
```
bl Montanas
```

**Notar que es una función global.**


#### **- Fondo de amanecer** 🌅 

##### *Funcionamiento*
Coloca en la mitad superior del framebuffer un fondo de amanecer copado.

##### *Llamada*
* Para el primer llamado cuando el framebuffer está totalmente en negro:
```
bl Dibuja_fondo_amanecer1
```

* Para cambiar de noche a día:
```
bl Dibuja_fondo_amanecer2
```


**Notar que son funciones globales.**


#### **- Sol de amanecer** ☀️ 

##### *Funcionamiento*
Coloca en la mitad superior derecha del framebuffer un sol de amanecer copado.

##### *Llamada*
```
bl Dibuja_sol_amanecer
```

**Notar que es una función global.**


#### **- Fondo de noche**

##### *Funcionamiento*
Coloca en la mitad superior del framebuffer un fondo de noche copado, reemplazando el del día pero sin modificar nada más que el fondo.

##### *Llamada*
```
bl Dibuja_fondo_noche
```

**Notar que es una función global.**


#### **- Luna** 🌙

##### *Funcionamiento*
Coloca en la mitad superior derecha del framebuffer una luna copada.

##### *Llamada*
```
bl Dibuja_luna
```

**Notar que es una función global.**


#### **- Pasto**  🌱

##### *Funcionamiento*
Coloca en la mitad inferior del framebuffer el pasto verde sólido y liso.

##### *Llamada*
```
bl Dibuja_pasto
```

**Notar que es una función global.**


### **Vegetación**

Estas funciones están implementadas en **`vegetacion.s`**

#### **- Pino** 🌲 

##### *Argumentos*
* `(x1,x2)` → Origen del tronco. El pino se genera desde este punto hacia arriba.

##### *Funcionamiento*

A partir de un punto, se genera un pino de tamaño fijo con dos posibles variaciones (grande y mediano).

##### *Llamada*

Pino grande ↓
```
bl Pino1
```
Pino mediano ↓
```
bl Pino2
```
Pino pequeño ↓
```
bl Pino3
```

Existe como utilidad auxiliar la función ```hojas``` la cual genera el árbol mediano sin tronco. Se la puede llamar usando ```bl Hojas```.

**Notar que es una función global.**

#### **- Arbusto** 🥬 

##### *Argumentos*
* `(x1,x2)` → Extremo superior izquierdo
* `(x3,x4)` → Extremo inferior derecho

##### *Funcionamiento*

A partir de dos puntos extremos, se genera un arbusto de tamaño variable. Es importante que se respete que (x1,x2) es el extremo superior izquierdo y (x3,x4) el extremo inferior derecho.

##### *Llamada*
```
bl Arbusto1
```

**Notar que es una función global.**

### **Etapa 1**

Estas funciones están implementadas en **`etapa_1.s`**

#### **- Carpa** ⛺

##### *Argumentos*
* `(x1,x2)` → Extremo izquierdo
* `(x3,x4)` → Extremo derecho
* `(x5,x6)` → Altura de la carpa

##### *Funcionamiento*

A partir de 3 puntos, genera una carpa.

##### *Llamada*
Carpa con cola hacia la derecha ↓
```
bl CarpaDer
```
Carpa con cola hacia la izquierda ↓
```
bl CarpaIzq
```
**Notar que es una función global.**

#### **- Fogata** 🔥

##### *Argumentos*
* `(x1,x2)` → Extremo izquierdo
* `(x3,x4)` → Extremo derecho
* DISCLAIMER: Ambos extremos deben estar sobre el mismo eje Y.

##### *Funcionamiento*

A partir de dos puntos extremos, se genera para arriba una fogata de tamaño variable. Para funcionamiento óptimo, elegir valores para x1 y x3 tal que la diferencia entre los dos sea no menor a ~ 20 píxeles

##### *Llamada*
```
bl Fogata
```

**Notar que es una función global.**

